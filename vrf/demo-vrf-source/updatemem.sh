
PATH_TO_TRACES_CODE="../../prv/TRACES/"
MODE=""
BENIGNFILE="../demo-prv-source/benign.s"
MALIGNFILE="../demo-prv-source/malicious.s"
APPLICATIONASM=$PATH_TO_TRACES_CODE"/NonSecure/Core/Src/application.s"


# test if the file $APPLICATIONASM exists
if [ ! -f "$APPLICATIONASM" ]
then
    echo "File $APPLICATIONASM does not exist"
    exit 0
fi

# get argument 1, if not provided, use default
if [ -z "$1" ]
then
    CMD=""
else
    CMD=$1
fi

# if argument 1 is == help, print help
if [ "$CMD" == "-help" ]
then
    echo "Usage: updatemem.sh [CMD] [CMD_ARG]"
    echo "CMD: 
    -help: print this help message
    -mode: mode of the execution available modes are: 
        * benign
        * malicious"
    exit 0
fi

# if argument 1 is == mode, print help
if [ "$CMD" == "-mode" ]
then
# test if argument 2 is provided
    if [ -z "$2" ]
    then
        echo "Please provide a mode argument"
        exit 0
    fi
    MODE=$2
    echo "Mode: $2"
fi

# if MODE==''
if [ -z "$MODE" ]
then
    echo "No command found!"
    exit 0
fi

# if mode ==  benign
if [ "$MODE" == "benign" ]; then
    # replace the application.s file with the benign.s file
    cp "$BENIGNFILE" "$APPLICATIONASM"
    echo "Copying $BENIGNFILE to $APPLICATIONASM"
elif [ "$MODE" == "malicious" ]; then
    # replace the application.s file with the malicious.s file
    cp "$MALIGNFILE" "$APPLICATIONASM"
    echo "Copying $MALIGNFILE to $APPLICATIONASM"
else
    echo "Invalid mode"
    exit 1
fi
