from structures import *
from utils import *
from parse_asm import *
import argparse

def arg_parser():
    '''
    Parse the arguments of the program
    Return:
        object containing the arguments
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument('--asmfile', metavar='N', type=str, required=True,
                        help='Path to the .s asm files generated by objdump')
    parser.add_argument('--cfgfile', metavar='N', type=str, default='cfg.pickle',
                        help='Output file to store serialized CFG. Default is cfg.pickle')
    parser.add_argument('--arch', choices=SUPPORTED_ARCHITECTURES,help='Processor architecture.',
                        default='elf32-msp430')
    
    args = parser.parse_args()
    return args

def main():
    args = arg_parser()

    # Parse asm file to python object
    lines = read_file(args.asmfile)

    # Set arch if provided
    arch = set_arch(args.arch)

    # Create the CFG from the asm file
    cfg = create_cfg(arch, lines)

    # Serialize cfg to output file
    dump(cfg,args.cfgfile)

if __name__ == "__main__":
    main()