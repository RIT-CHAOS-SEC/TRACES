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
    index = -1

    shadow_stack = deque()

    app_entry = 0
    verifyFile = open("logs/verify.log", "w")
    current_node = cfg.head
    for log_node in cflog:
        index += 1
        print("Current node", file=verifyFile)
        current_node.printNode(verifyFile)
        print("cflog_startaddr: "+str(cflog_startaddr), file=verifyFile)
        print("log_node.dest_addr: "+str(log_node.dest_addr), file=verifyFile)
        print(" ", file=verifyFile)
        if cflog_startaddr == log_node.dest_addr and app_entry == 0:
            app_entry = 1
            current_node = cfg.nodes[log_node.dest_addr]
            continue

        # Check destinations
        if current_node.type == 'uncond' or current_node.type == 'cond':
            if log_node.dest_addr in current_node.successors or log_node.dest_addr == current_node.adj_instr:
                current_node = cfg.nodes[log_node.dest_addr]
                continue
        # If its a call, we need to push adj addr to shadow stack
        elif current_node.type == 'call': 
            shadow_stack.append(current_node.adj_instr)
            if log_node.dest_addr in current_node.successors:
                current_node = cfg.nodes[log_node.dest_addr]
                continue
        elif current_node.type == 'ret': 
            ret_addr = shadow_stack.pop()
            if log_node.dest_addr == ret_addr:
                current_node = cfg.nodes[log_node.dest_addr]
                continue
            else:
                #TODO: Raise a Return Address Violation
                pass
                #err = raise(custom exception)
        
        return False, current_node, log_node, index
    return True, current_node, None, index

def parse_cflog(cflog_file):
    # To make this more generalized, we may need to add a delimeter
    # Between start and end address
    cflog_lines = read_file(cflog_file)

    cflog = []
    for line in cflog_lines:
        line = line.split(':')
        if len(line) > 1 and line[1][0] != '0': #Check if the line is a loop counter
            s = '0x' + line[0]
            d = '0x' + line[1]
            cflog.append(CFLogNode(s,d))
        elif line[0] == "dffe" or line[1] == "a000":
            continue
        else: # add loop counter value to prev LogNode
            cflog[-1].loop_count = int(line[0],16)

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
    valid, current_node, offending_node, cflog_index = verify(cfg, cflog, args.startaddr)

    if valid:
        print(bcolors.GREEN + '[+] CFLog is VALID!' + bcolors.END)
    else:
        print(bcolors.RED + '[-] CFLog is INVALID!' + bcolors.END)
        print("Offending CFLog entry: "+str(cflog_index))
        print("Valid destinations: "+str(current_node.successors))
        print("Logged destination: "+str(offending_node.dest_addr))

if __name__ == "__main__":
    main()