from collections import deque
import argparse
import pickle

from structures import *
from utils import read_file

def verify(cfg, cflog, cflog_startaddr):
    '''
    Function verifies whether given CFLog is valid.
    Returns True if log is valid, else returns False
    '''
    # Instantiate shadow stack
    index = 0

    shadow_stack = deque()
    shadow_stack_violation = False
    shadow_stack_addr = ''

    app_entry = 0
    verifyFile = open("logs/verify.log", "w")
    current_node = cfg.head
    while index < len(cflog):
        print(" ", file=verifyFile)
        log_node = cflog[index]
        print("Current node", file=verifyFile)
        current_node.printNode(verifyFile)
        # print("cflog_startaddr: "+str(cflog_startaddr), file=verifyFile)
        print("log_node.dest_addr: "+str(log_node.dest_addr), file=verifyFile)

        # print(log_node.dest_addr)
        if cflog_startaddr == log_node.dest_addr and app_entry == 0:
            app_entry = 1
            current_node = cfg.nodes[log_node.dest_addr]
            continue

        if current_node.type == 'uncond':
            current_node = cfg.nodes[current_node.successors[0]]
            print("-----", file=verifyFile)
            print("changed node", file=verifyFile)
            current_node.printNode(verifyFile)
            print("-----", file=verifyFile)

        # Check destinations
        if current_node.type == 'cond':
            if log_node.dest_addr in current_node.successors or log_node.dest_addr == current_node.adj_instr:
                current_node = cfg.nodes[log_node.dest_addr]
                index += 1
                continue

        # If its a call, we need to push adj addr to shadow stack
        elif current_node.type == 'call': 

            shadow_stack.append(current_node.adj_instr)
            print("PUSH to shadow stack: "+str(current_node.adj_instr), file=verifyFile)
            if 'SECURE' not in current_node.instr_addrs[-1].arg:
                # print(f"SECURE not in {current_node.instr_addrs[-1].arg}")
                current_node = cfg.nodes[current_node.successors[0]]
                continue
            else: #indirect call, so validate by checking shadow stack later
                index += 1
                current_node = cfg.nodes[log_node.dest_addr]
                continue
        elif current_node.type == 'ret': 
            ## If return is the special return from NS-SW, continue
            
            if log_node.dest_addr == "0xfefffffe":
                index += 1
                continue
            else:
                shadow_stack_addr = shadow_stack.pop()
                print("POP from shadow stack: "+str(shadow_stack_addr), file=verifyFile)
                if log_node.dest_addr == shadow_stack_addr:
                    index += 1
                    current_node = cfg.nodes[log_node.dest_addr]
                    continue
                else:
                    shadow_stack_violation = True

        return False, current_node, log_node, index, shadow_stack_violation, shadow_stack_addr
    return True, current_node, None, index, shadow_stack_violation, shadow_stack_addr

def parse_cflog(cflog_file):
    # To make this more generalized, we may need to add a delimeter
    # Between start and end address
    cflog_lines = read_file(cflog_file)

    cflog = []
    for line in cflog_lines:
        if line[:4] == 'ffff': #Check if the line is a loop counter
            # add loop counter value to prev LogNode
            cflog[-1].loop_count = int(line[4:],16)
        else: # not loop counter
            d = '0x' + line
            cflog.append(CFLogNode(None,d))

    return cflog

def set_cfg_head(cfg, start_addr, end_addr=None):
    try: 
        cfg.head = cfg.nodes[start_addr]
    except KeyError as err:
        print(bcolors.RED + '[!] Error: Start address to verify from is not a valid node' + bcolors.END)
        exit(1)
    return cfg

def load_cfg(filename):
    f = open(filename,'rb')
    cfg = pickle.load(f)
    f.close()
    return cfg

def arg_parser():
    '''
    Parse the arguments of the program
    Return:
        object containing the arguments
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument('--cfgfile', metavar='N', type=str, default='cfg.pickle',
                        help='Path to input file to load serialized CFG. Default is cfg.pickle')
    parser.add_argument('--funcname', metavar='N', type=str, default='main',
                        help='Name of the function to be tracked in the attestation. Set to "main" by default.')
    parser.add_argument('--cflog', metavar='N', type=str,
                        help='File where the cflog to be attested is.')
    parser.add_argument('--startaddr', metavar='N', type=str,
                        help='Address at which to begin verification. Address MUST begin with "0x"')
    parser.add_argument('--endaddr', metavar='N', type=str,
                        help='Address at which to end verification')

    args = parser.parse_args()
    return args

def main():
    args = arg_parser()

    # Load and parse CFLog
    cflog = parse_cflog(args.cflog)

    # Load cfg
    cfg = load_cfg(args.cfgfile)

    # If start addr not provided, lookup addr of function (or label) instead
    if not args.startaddr:
        try:
            start_addr = cfg.label_addr_map[args.funcname]
        except KeyError:
            print(f'{bcolors.RED}[!] Error: Invalid Function Name [{args.funcname}]{bcolors.END}')
            exit(1)
    else:
        start_addr = args.startaddr

    # Set the cfg head to the start address of where we want to attest
    cfg = set_cfg_head(cfg, start_addr)

    # Verify the cflog against the CFG
    valid, current_node, offending_node, cflog_index, shadow_stack_violation, shadow_stack_addr = verify(cfg, cflog, args.startaddr)

    if valid:
        print(bcolors.GREEN + '[+] CFLog is VALID!' + bcolors.END)
    else:
        if shadow_stack_violation:
            print(bcolors.RED + '[-] CFLog is INVALID! -- Return address violation' + bcolors.END)
            print("Offending CFLog entry: "+str(cflog_index))
            print("Valid destination: "+str(shadow_stack_addr))
            print("Logged destination: "+str(offending_node.dest_addr))
        else:
            print(bcolors.RED + '[-] CFLog is INVALID!' + bcolors.END)
            print("Offending CFLog entry: "+str(cflog_index))
            print("Valid destination(s): "+str(current_node.successors))
            print("Logged destination: "+str(offending_node.dest_addr))

if __name__ == "__main__":
    main()