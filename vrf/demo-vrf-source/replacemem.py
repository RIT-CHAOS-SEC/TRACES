import sys, os, argparse
# receive arguments

def arg_parser() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description='Replace memory in the trace')    
    parser.add_argument('input', type=str, help='Input trace file')
    parser.add_argument('output', type=str, help='Output trace file')
    return parser.parse_args()



def get_last_memory(input_file: str) -> str:
    with open(input_file, 'r') as f:
        lastmem = [x for x in f.readlines() if x.strip() != ''][-1].strip().split(':')[0]
    return lastmem

def replace_memory( output_file: str, lastmem: str) -> None:
    # find line with the pattern "#define	NONSECURE_FLASH_END"
    # replace the value with the last memory address
    with open(output_file, 'r') as f:
        lines = f.readlines()
    
    with open(output_file, 'w') as f:
        for line in lines:
            if line.startswith("#define	NONSECURE_FLASH_END"):
                f.write(f"#define	NONSECURE_FLASH_END	0x{lastmem}\n")
            else:
                f.write(line)
    return

def main()-> None:
    print("Replace memory in the trace")
    args = arg_parser()
    lastmem = get_last_memory(args.input)
    replace_memory(args.output, lastmem)
    print(f"Memory replaced with {lastmem}")
    return

if __name__ == '__main__':
    main()
