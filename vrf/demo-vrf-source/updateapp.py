import os, sys, argparse

def replace_in_file(file, old, new):
    
    # if line starts with old, replace it with new
    with open(file, 'r') as f:
        lines = f.readlines()

    with open(file, 'w') as f:
        for line in lines:
            if line.startswith(old):
                f.write('#define APP_SEL '+new+'\n')
            else:
                f.write(line)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Update the application')
    parser.add_argument('appname', type=str, help='Application name')
    parser.add_argument('outputfile', type=str, help='File to write the output to')
    args = parser.parse_args()

    old = '#define APP_SEL'
    print(f'Updating app to {args.appname}')
    replace_in_file(args.outputfile, old, args.appname)
    sys.exit(0)