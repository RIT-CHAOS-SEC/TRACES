from hashlib import blake2b
import serial
import time
from dataclasses import dataclass
import sys,os
import binascii
import time
from parse_mem import *
import threading
import serial.tools.list_ports as slp
import serial.tools.list_ports
from ecdsa import SigningKey, NIST256p, VerifyingKey
import hashlib
import hmac
from hashlib import sha256
from ecdsa.util import sigencode_der
from ecdsa.util import sigdecode_der
from ecdsa import BadSignatureError
from verify import *
from generate_cfg import *

### INIT UTILS ###############
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
colors = bcolors()

def printblue(message,end='\n'):
    print(colors.OKBLUE+message+bcolors.ENDC,end=end)
def printred(message,end='\n'):
    print(colors.FAIL+message+bcolors.ENDC,end=end)
def printgreen(message,end='\n'):
    print(colors.OKGREEN+message+bcolors.ENDC,end=end)
def printyellow(message,end='\n'):
    print(colors.WARNING+message+bcolors.ENDC,end=end)
def printcyan(message,end='\n'):
    print(colors.OKCYAN+message+bcolors.ENDC,end=end)

#### Serial Communication 
def scan_for_STM32_device():
    ports = slp.comports()
    for p in ports:
        port, desc, hwid = p
        if desc.startswith("STMicroelectronics"):
            print("Found STM32 Device: "+str(port)+", "+str(desc))
            return port
    printred("ERROR :  STM32 device not found!!!!")
    return None

def scan_for_STM32_device_linux():
    ports = serial.tools.list_ports.comports()
    for port in ports:
        if port.description.startswith("STM32 STLink"):
            print('STM32 STLink found at :',port.device)
            return port.device
    printred("ERROR :  STM32 device not found!!!!")
    return None
    
def open_serial():
    # Check variables
    if (os.name == 'nt'):
        dev = scan_for_STM32_device()
    elif (os.name == 'posix'):
        dev = scan_for_STM32_device_linux()
    baud = 921600
    ser = serial.Serial(dev, baud, timeout=10000000)
    return ser

### DATA TYPES #####
@dataclass
class ProtocolConfig:
    MAX_CFLOG_SIZE = 1024*50
    SIGNATURE_SIZE = 64
    METADATA_SIZE = 2
    PMEM_SIZE = 256
    KEY_SIZE = 64
    CHAL_SIZE = KEY_SIZE
    HASH_SIZE = 64
    report_num = 0
    symmetric_key = []
    challenge = []
    test_pmem = []
    serial = open_serial()
    EXPECTED_APP_HASH = ''
    EXPECTED_SECURE_WORLD_HASH = ''
    SEC_WORLD = 0
    NSC = 1
    NS_WORLD = 2
    program_mem_chunks = None
    hash_memory = None
    comm_time = 0
    prv_sign_rep_time = 0
    prv_verify_resp_time = 0
    app_start_addr = ""
    start_time = 0
    end_time = 0
    mode = ''
    cflog = None
    @property
    def aermin():
        aux = [0xe0, 0x00] #aer_min = 0xe000
        return ( b''.join([aux[0].to_bytes(1,byteorder='big'), aux[1].to_bytes(1,byteorder='big')]))
    @property
    def aermax():
        aux = [0xe2, 0x64]   
        return (b''.join([aux[0].to_bytes(1,byteorder='big'), aux[1].to_bytes(1,byteorder='big')]))

@dataclass
class Report:
    Prv_Chl = ""
    Signature = ""
    CFA_Log_Size = ""
    CFA_Log = ""
    log_number = ""
    hash_memory = ""
    IsFinal = ""
    report_bytes = ""

@dataclass
class Response:
    New_Chal = ""
    VerifyResult = ""
    Signature = ""
    response_bytes = ""

@dataclass
class ProtocolMessages:
    SIZE = 4
    INITIALIZE_PROTOCOL = b'aaaa'
    INITIALIZE_PROTOCOL_RESPONSE = b'aaaa'
    ACCEPTED_REPORT = b'VVVV'
    HEAL_DEVICE = b'hhhh'
    RESET_DEVICE = b'rrrr'
    VALID = b'vvvv'
    INVALID = b'iiii'
    CONTINUE_APPLICATION = b'CCCC'
    BEGGINING_OF_REPORT = b'REPO'
    PARTIAL_REPORT = b'P'
    END_OF_APPLICATION = 'F'
    BEGGINING_OF_CHAL = b'CHAL'


def print_protocol_config():
    printcyan("\nProtocol Information:")
    printgreen("Key:")
    print(str(pconfig.symmetric_key))
    printgreen("Challenge")
    print(str(pconfig.challenge))
    printgreen("Memory Hash")
    print(pconfig.hash_memory)
    # printgreen("test_pmem: ")
    # print(str(pconfig.test_pmem))
    printgreen('Serial Connection: ')
    print(str(pconfig.serial)+'\n\n')

def print_report():
    printgreen("CFA Log Size :",end='')
    print(str(cfa_report.CFA_Log_Size))
    # printgreen("CFA Log :")
    # print(str(cfa_report.CFA_Log))
    printgreen("Memory Hash:")
    print(str(cfa_report.hash_memory))
    printgreen("Signature:")
    print(str(cfa_report.signature))
    printgreen("IsFinal:")
    print(str(cfa_report.IsFinal))

def print_bytes_as_hex(byte_string):
    for b in byte_string:
        print(hex(b), end=' ')
    print(" ")  

### END UTILS ###############
#############################

### PROTOCOL DATA ###########
def update_challenge(report_num,prev_chal=None):
    if report_num == 0:
        new_chal = []
        for i in range(0, pconfig.KEY_SIZE):
            new_chal.append((65+i).to_bytes(1,byteorder='big'))
        new_chal = b''.join(new_chal)
        return new_chal
    else:
        new_chal = ((prev_chal[0]+1)%256).to_bytes(1,byteorder='big')+prev_chal[1:]
        return new_chal

def generate_initial_data():
    ## Generate Initial Key
    for i in range(0, pconfig.KEY_SIZE):
        pconfig.symmetric_key.append(i.to_bytes(1, byteorder="big"))
    pconfig.symmetric_key = b''.join(pconfig.symmetric_key)

    ## Generate Initial challenge
    pconfig.challenge = update_challenge(pconfig.report_num,None)

    ## Test PMEM
    for i in range(0, pconfig.PMEM_SIZE):
        pconfig.test_pmem.append(i.to_bytes(1, byteorder="big"))
    pconfig.test_pmem = b''.join(pconfig.test_pmem)

### Crypto ##################

def hash_memory():
    # blake_hash = blake2b(key=pconfig.symmetric_key)
    # for mem_chunk in pconfig.program_mem_chunks:
    #     blake_hash.update(mem_chunk)
    # pconfig.hash_memory = blake_hash.digest()
    ns_bytes = b''
    for seg in pconfig.program_mem_chunks:
        ns_bytes += seg
    print("ns_bytes: "+str(len(ns_bytes)))
    pconfig.hash_memory = sha256(ns_bytes).digest()

### Verifier ###################
def verify_report():
    print("------------- VERIFY ---------------")
    ## For debug
    # h_report = sha256(cfa_report.report_bytes)
    # print("h_report "+str(len(h_report.digest()))+": "+str(h_report.digest()))

    # pk_str = b"t/\xbe\xafO\xf4\x1d'H\xadN#\x84y\xa4Bh\x8b\xe6\x18\x98E\x99\xf1\x10\x03N\xf6^\xe1\x1eOI\xd0\x8e\xe0S\xa0\xe2}\xb5\t\xf1\xfd.\xa5cp\xc0^ 1\xc5\xc0\xcbK\x01u\xd78\xeb+D\x1b"
    # pk = VerifyingKey.from_string(pk_str, curve=NIST256p, hashfunc=sha256)
    # print("Using pk "+str(type(pk))+" : "+str(pk.to_string()))

    # print("Running pk.verify("+str(type(cfa_report.signature))+", "+str(type(cfa_report.report_bytes))+")")
    
    # try:

    # result = pk.verify(cfa_report.signature, cfa_report.report_bytes)
    sk = b'\x89\x8b\x0c\xde\xab\xb5\x86\x97<\r\xa9\x15\x8e\x01\x84\xe7C\xf7|5\xb9\xc2\xb8\xf7\x93b\x92\x87\xcaY\x8b\xb2'
    key = sk[:32]
    # print(key)
    # print(len(key))
    exp_hmac = hmac.new(key, msg=cfa_report.report_bytes, digestmod=hashlib.sha256).digest()
    prv_hmac = cfa_report.signature[:32]
    # print("EXPECTED HMAC: ")
    # print_bytes_as_hex(exp_hmac)
    # print("PRV HMAC: ")
    # print_bytes_as_hex(prv_hmac)
    print("Validating MAC...")
    valid_mac = True
    for i in range(32):
        if prv_hmac[i] != exp_hmac[i]:
            valid_mac = False

    if valid_mac:
        print("VALID MAC")
    else:
        print("INVALID MAC")
    
    ####################
    if pconfig.mode == 'aud':
        print("Validating CFLog...")

        cflog = parse_cflog("../cflogs/"+str(pconfig.report_num)+".cflog")

        cfg = load("objects/cfg.bin")

        valid_cflog, current_node, offending_node, cflog_index, shadow_stack_violation, shadow_stack_addr = verify(cfg, cflog, pconfig.app_start_addr)

        if valid_cflog:
            print("VALID CFLOG")
        else:
            print("INVALID CFLOG")
            print(f"Offending CFLog entry  ({current_node.type}): ({cflog_index})")
            print("Logged destination: "+str(offending_node.dest_addr))
            if shadow_stack_violation:
                print("Valid destination: "+str(shadow_stack_addr))
            else:
                print("Valid destinations: "+str(current_node.successors))
            return comm_protocol_messages.HEAL_DEVICE
    else:
        valid_cflog = True

    # except BadSignatureError:
    #     print("FAILED VERIFICATION: invalid signature")
    #     # return comm_protocol_messages.HEAL_DEVICE
    if cfa_report.IsFinal == comm_protocol_messages.END_OF_APPLICATION or pconfig.mode == 'sense':
        return comm_protocol_messages.ACCEPTED_REPORT
    else:
        return comm_protocol_messages.CONTINUE_APPLICATION

def generate_response():
    # print("------------- USE PRIV KEY TO SIGN ---------------")
    # sk_str = b'\x89\x8b\x0c\xde\xab\xb5\x86\x97<\r\xa9\x15\x8e\x01\x84\xe7C\xf7|5\xb9\xc2\xb8\xf7\x93b\x92\x87\xcaY\x8b\xb2'

    # sk = SigningKey.from_string(sk_str, curve=NIST256p, hashfunc=sha256)
    # print("sk "+str(type(sk))+" : \n"+str(sk.to_string()))
    
    # add challenge    
    cfa_response.New_Chal = pconfig.challenge
    # print("cfa_response.New_Chal: "+str(cfa_response.New_Chal))
    cfa_response.response_bytes = cfa_response.New_Chal

    # Verification result
    cfa_response.VerifyResult = b'\x01'
    # print("cfa_response.VerifyResult: "+str(cfa_response.VerifyResult))
    cfa_response.response_bytes += cfa_response.VerifyResult

    # Signature
    # cfa_response.Signature = sk.sign(cfa_response.response_bytes)
    sk = b'\x89\x8b\x0c\xde\xab\xb5\x86\x97<\r\xa9\x15\x8e\x01\x84\xe7C\xf7|5\xb9\xc2\xb8\xf7\x93b\x92\x87\xcaY\x8b\xb2'
    key = sk[:32]
    cfa_response.Signature = hmac.new(key, msg=cfa_response.response_bytes, digestmod=hashlib.sha256).digest()
    # cfa_response.Signature += cfa_response.Signature
    # print("cfa_response.Signature: "+str(cfa_response.Signature))


def send_serial(data):
    debug = False
    if debug:
        printcyan("SERIAL SEND: "+str(data)+'\n')
    pconfig.serial.write(data)

### Protocol #####################
def send_initial_message():
    in_data = b'\x00'
    printyellow("Waiting prv response ...\n")
    while in_data != comm_protocol_messages.INITIALIZE_PROTOCOL_RESPONSE:
        pconfig.serial.flush()  
        send_serial(b"COMD")
        send_serial(comm_protocol_messages.INITIALIZE_PROTOCOL)
        in_data = pconfig.serial.read(comm_protocol_messages.SIZE)
        printgreen("Data Received From prv : ", end='')
        print(str(in_data) + ' ',end='')
        printgreen("Data Expected: ", end='')
        print(comm_protocol_messages.INITIALIZE_PROTOCOL_RESPONSE)

def send_response():
    comm_start = time.perf_counter()
    # printyellow("Sending new challange ...")
    # print(str(pconfig.challenge))
    send_serial(pconfig.challenge)
    # printyellow("Waiting prv response ...")
    # pconfig.serial.read_until(comm_protocol_messages.BEGGINING_OF_CHAL)
    # prv_chal = pconfig.serial.read(pconfig.CHAL_SIZE)
    # printgreen("\nPrv Challange:")
    # print(str(prv_chal)+" ("+str(type(prv_chal))+")"+'\n')
    # cfa_report.Prv_Chl = prv_chal

    # printyellow("Sending Verifier Signature")
    send_serial(cfa_response.Signature)
    # echo = pconfig.serial.read(pconfig.SIGNATURE_SIZE)
    # print("echo: "+str(echo))
    comm_end = time.perf_counter()
    # pconfig.comm_time += comm_end - comm_start

    # pconfig.prv_verify_resp_time = pconfig.serial.read(4)
    # print(f"send_response time: {1000*(comm_end-comm_start)}")
    print(" ")
    return


def send(val):
    comm_start = time.perf_counter()
    if val ==comm_protocol_messages.HEAL_DEVICE:
        printred("Report Rejected, requesting HEAL of device ...")
    elif cfa_report.IsFinal == comm_protocol_messages.END_OF_APPLICATION:
        printyellow("Report Accepted!")
    elif val == comm_protocol_messages.CONTINUE_APPLICATION:
        printyellow("Sending continue request ...")
    send_serial(b"COMD")
    send_serial(val)
    comm_end = time.perf_counter()
    # pconfig.comm_time += comm_end - comm_start

def read_report():
    '''
        Summary : Read the report from the vrf
        Report Structure: 
            uint8_t     Signature [BLAKE2B_OUTBYTES];
            uint8_t     Hash of Memory [BLAKE2B_OUTBYTES];
            uint8_t     Is it the final report? ;
            uint16_t    CFlog size;
            uint16_t    Number of the log; // init = 0
            uint32_t    CFLog [MAX_CF_LOG_SIZE];
    '''
    prv_exec_start = time.perf_counter()
    # pconfig.serial.read_until(comm_protocol_messages.BEGGINING_OF_REPORT)
    msg = pconfig.serial.read(4)
    while msg != comm_protocol_messages.BEGGINING_OF_REPORT:
        print(msg)
    print(msg)
    prv_exec_end = time.perf_counter()
    prv_exec_time = 1000*(prv_exec_end-prv_exec_start)

    receive_report_start = time.perf_counter()

    
    # print("cfa_report.signature: ")#+str(cfa_report.signature))
    # print_bytes_as_hex(cfa_report.signature)
    # print(" ")

    if pconfig.mode == 'sense':
        ##### Baseline APP
        #'''
        output_data = pconfig.serial.read(4)
        print("output_data : "+str(output_data))
        cfa_report.report_bytes = output_data
        cfa_report.signature = pconfig.serial.read(64)
        #'''
    elif pconfig.mode == 'aud':
        ##### CFA / TRACES only
        #'''
        cfa_report.signature = pconfig.serial.read(64)

        cfa_report.IsFinal = pconfig.serial.read(2)
        cfa_report.report_bytes = cfa_report.IsFinal
        cfa_report.IsFinal = chr(int.from_bytes(cfa_report.IsFinal, "little"))
        print("cfa_report.IsFinal: "+str(cfa_report.IsFinal))
        # print(" ")
        
        # cfa_report.hash_memory = pconfig.serial.read(32)
        # cfa_report.report_bytes += cfa_report.hash_memory
        cfa_report.report_bytes += pconfig.hash_memory
        # print("cfa_report.hash_memory: ")#+str(cfa_report.hash_memory))
        # print_bytes_as_hex(cfa_report.hash_memory)
        # print(" ")
        cfa_report.CFA_Log_Size = pconfig.serial.read(2)
        cfa_report.report_bytes += cfa_report.CFA_Log_Size
        print_bytes_as_hex(cfa_report.CFA_Log_Size)
        cfa_report.CFA_Log_Size = int.from_bytes(cfa_report.CFA_Log_Size, "little") 
        print("cfa_report.CFA_Log_Size: "+str(cfa_report.CFA_Log_Size))
        print(" ")
        cfa_report.CFA_Log = pconfig.serial.read(4*cfa_report.CFA_Log_Size)
        cfa_report.report_bytes += cfa_report.CFA_Log
        # print("cfa_report.CFA_Log: ")#+str(cfa_report.CFA_Log))
        # print_bytes_as_hex(cfa_report.CFA_Log)
        # print(" ")
        #'''
        process_cflog_bytes(cfa_report.CFA_Log, cfa_report.CFA_Log_Size, cfa_report.log_number) 

    receive_report_end = time.perf_counter()
    receive_report_time = receive_report_end-receive_report_start
    return prv_exec_time, receive_report_time

def process_cflog_bytes(CFLog_bytes, CFLog_size, log_number):
    f = open("../cflogs/"+str(pconfig.report_num)+".cflog", "w")
    # needs to print every 4 bytes in reverse order
    byte_str = ""
    for i in range(0, 4*CFLog_size):
        if i % 4 == 0:
            byte_str += hex(CFLog_bytes[i+3])[2:]
        elif i % 4 == 1:
            if CFLog_bytes[i+1] < 16:
                byte_str += '0'
            byte_str += hex(CFLog_bytes[i+1])[2:]
        elif i % 4 == 2:
            if CFLog_bytes[i-1] < 16:
                byte_str += '0'
            byte_str += hex(CFLog_bytes[i-1])[2:]
        elif i % 4 == 3:
            if CFLog_bytes[i-3] < 16:
                byte_str += '0'
            byte_str += hex(CFLog_bytes[i-3])[2:]
            
            
            # if i % 8 == 7:
            #     byte_str += "\n"
            #     f.write(byte_str)
            #     byte_str = ""
            # else:
            #     byte_str += ":"
            #     # f.write(byte_str)

            ## add ':' for cfg verify
            # if byte_str[:4] == 'ffff':
            #     byte_str = byte_str[:4]+":"+byte_str[4:]
            # else:
            #     byte_str = ":"+byte_str
            f.write(byte_str+"\n")
            # print(byte_str)
            byte_str = ""

            
    f.close()


def receive_report(count):
    printyellow(f"----------- WAITING FOR REPORT {count} -----------\n")
    prv_exec_time, receive_report_time = read_report()
    # pconfig.comm_time += comm_end - comm_start
    print(" ")
    printgreen(f"----------- REPORT {count} RECEIVED -----------\n")
    print_report()
    if cfa_report.IsFinal == comm_protocol_messages.END_OF_APPLICATION:
        return 0, prv_exec_time, receive_report_time
    else:
        return 1, prv_exec_time, receive_report_time

# 80413f0
# 804144a
# 804147e
# 804149e
# 80414aa
# 80414ba
# 8041820
# 804180c
# 80413b4
# 80413e0
# 80413e8

def start_protocol():
    
    count = 0
    send_resp_time=0
    gen_resp_time=0
    verify_time = 0
    isFinal = 1
    verify_decision = 1

    printgreen("Sending Initial Message ...\n")
    print("Starting timer...")
    pconfig.start_time = time.perf_counter()
    send_initial_message()
    
    printgreen("\nSending Challenge ...\n")

    gen_resp_start = time.perf_counter()
    generate_response()
    gen_resp_end = time.perf_counter()
    gen_resp_time += 1000*(gen_resp_end-gen_resp_start)

    send_resp_start = time.perf_counter()
    send_response()
    send_resp_end = time.perf_counter()
    send_resp_time += 1000*(send_resp_end-send_resp_start)

    isFinal, prv_exec_round_time, receive_report_round_time = receive_report(count)
    prv_exec_time = prv_exec_round_time
    receive_report_time = receive_report_round_time

    if pconfig.mode == 'sense':
        isFinal = False

    while (isFinal): # while receive partial reports
        
        printgreen("\nPartial Report Received ...\n")
        verify_time_start = time.perf_counter()
        verify_decision = verify_report()
        verify_time_stop = time.perf_counter()
        verify_time += 1000*(verify_time_stop-verify_time_start)

        ## clean serial buffer
        pconfig.serial.reset_input_buffer()  

        ## Send continue request or heal command
        gen_resp_start = time.perf_counter()
        pconfig.report_num += 1
        pconfig.challenge = update_challenge(pconfig.report_num,pconfig.challenge)
        generate_response()
        gen_resp_end = time.perf_counter()
        gen_resp_time += 1000*(gen_resp_end-gen_resp_start)

        send_resp_start = time.perf_counter()
        send(verify_decision)
        send_response()
        send_resp_end = time.perf_counter()
        send_resp_time += 1000*(send_resp_end-send_resp_start)

        count += 1

        if verify_decision == comm_protocol_messages.HEAL_DEVICE:
            break

        isFinal, prv_exec_round_time, receive_report_round_time = receive_report(count)
        prv_exec_time += prv_exec_round_time
        receive_report_time += receive_report_round_time
    
    if verify_decision != comm_protocol_messages.HEAL_DEVICE:
        printgreen("\nFinal Report Received ...\n")
        
        verify_time_start = time.perf_counter()
        verify_decision = verify_report()
        verify_time_stop = time.perf_counter()
        verify_time += 1000*(verify_time_stop-verify_time_start)

        ## Send end request
        send_resp_start = time.perf_counter()
        send(verify_decision)
        send_resp_end = time.perf_counter()
        send_resp_time += 1000*(send_resp_end-send_resp_start)
        
        last_part = 1000*(verify_time_stop-verify_time_start)+1000*(send_resp_end-send_resp_start)
        # print(f'Last part: {last_part} ms')

    pconfig.end_time = time.perf_counter()

    print()
    return verify_decision, prv_exec_time, receive_report_time, send_resp_time, gen_resp_time, verify_time

################################################################

def init_global_variables():
    ## Init Global vars
    global pconfig
    pconfig = ProtocolConfig()
    global comm_protocol_messages 
    comm_protocol_messages = ProtocolMessages()
    global cfa_report 
    cfa_report = Report()
    global cfa_response
    cfa_response = Response()

    ## Assert memory files
    assert os.path.exists("./objects/NonSecure.mem")
    assert os.path.exists("./objects/Secure.mem")
    
    # pconfig.program_mem_chunks = parse_mem(pconfig.SEC_WORLD) + parse_mem(pconfig.NSC) + parse_mem(pconfig.NS_WORLD)
    pconfig.program_mem_chunks = parse_mem(pconfig.NS_WORLD)


if __name__ == "__main__":
    dir_name = "../cflogs/"
    test = os.listdir(dir_name)

    for item in test:
        if item.endswith(".cflog"):
            os.remove(os.path.join(dir_name, item))

    path_str = ""
    for p in sys.path:
        path_str += p
    os.stat(str(p))
    init_global_variables()
    generate_initial_data()
    hash_memory()

    pconfig.mode = 'aud'

    # # build cfg
    if pconfig.mode == 'aud':
        prv_file_path = "../../prv/TRACES/NonSecure/Debug/TRACES_NonSecure.list"
        asm_lines = read_file(prv_file_path)
        cfg = create_cfg(set_arch("armv8-m33"), asm_lines)
        pconfig.app_start_addr = cfg.label_addr_map['application']
        print(f'Start_addr: { pconfig.app_start_addr}')
        cfg = set_cfg_head(cfg, pconfig.app_start_addr)
        dump(cfg, "objects/cfg.bin")

    in_cmd = ""
    global end_to_end_time
    end_to_end_time = 0
    global total_comm
    total_comm = 0
    
    verify_decision = ""
    while(in_cmd != 's' and verify_decision != comm_protocol_messages.HEAL_DEVICE and cfa_report.IsFinal != comm_protocol_messages.END_OF_APPLICATION):
        printcyan("--------------------------- NEW PROTOCOL ------------------------------")
        print_protocol_config()
        # PRESS ENTER TO START
        printyellow('PRESS ENTER TO START PROTOCOL (\'s\' to stop)...\n')
        in_cmd = input()
        if in_cmd == 's':
            break
        printgreen(f'Starting protocol ...\n')

        # START PROTOCOL
        verify_decision, prv_exec_time, receive_report_time, send_resp_time, gen_resp_time, verify_time = start_protocol()  
        
        # printblue('Elapsed time : '+str(end - start)+'s or ' + str((end - start)*1000)+'ms\n')
        pconfig.report_num += 1
        pconfig.challenge = update_challenge(pconfig.report_num,pconfig.challenge)
        ## use prv side since something is up here...
        # total_comm += pconfig.comm_time
        end_to_end_time += 1000*(pconfig.end_time-pconfig.start_time)
        printblue(f'mode: {pconfig.mode}')
        printblue(f'Waiting for prv: {prv_exec_time} ms')
        printblue(f'Receive report time: {receive_report_time} ms')
        printblue(f'Verify Report Time: {verify_time} ms')
        printblue(f'Gen. response time: {gen_resp_time}')
        printblue(f'Send response time: {send_resp_time}')
        printblue(f'Total time: {end_to_end_time}ms\n')
        print('---------------------------------------------')
        cf_events, cflog_entries = get_total_cflog_size('../cflogs/')
        print(f'Total CF events: {cf_events}') # cflog size if no loops
        print(f'Total CFlog bytes: {4*cflog_entries}')
        
    