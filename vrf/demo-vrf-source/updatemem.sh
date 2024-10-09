
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
fi


# if argument 1 is == mode, print help
if [ "$CMD" == "-app" ]
then
# test if argument 2 is provided
    if [ -z "$2" ]
    then
        echo "Please provide a mode argument"
        exit 0
    fi
    APP=$2
fi

# if MODE=='' or APP=='' then exit
if [ -z "$MODE" ] && [ -z "$APP" ]
then
    echo "No command found!"
    exit 0
fi


if [ "$MODE" != "" ]
then
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
fi


printAvailableApps(){
echo "Available applications:
    - BASIC
    - ULT
    - TEMP
    - SYRINGE
    - GEIGER
    - GPS
    - SEARCH
    - CRC32
    - DUFF
    - PRIME
    - DIJKSTRA
    - HAMMING
    - ATTACK
    - MOUSE
"
}

applist=("BASIC" "ULT" "TEMP" "SYRINGE" "GEIGER" "GPS" "SEARCH" "CRC32" "DUFF" "PRIME" "DIJKSTRA" "HAMMING" "ATTACK" "MOUSE")


replaceApp(){
    # replace the application.s file with the malicious.s file
    echo $1
    echo $(pwd)

    python updateApp.py $1 application.h
    ./pre-process.sh application
#     cd $PATH_TO_TRACES_CODE/NonSecure/Debug
#     make clean
#     cd $PATH_TO_TRACES_CODE/Secure/Debug
#     make clean
# 
}

if [ "$APP" != "" ]
then
    # save current directory

    # change directory to the TRACES directory
    

    # if app == help
    if [ "$APP" == "help" ]
    then
        printAvailableApps
        exit 0
    fi

    # Check if value is in the list
    if [[ " ${applist[@]} " =~ " ${APP} " ]]; then
        echo "$APP is in the list."
        replaceApp $APP
    else
        echo "$APP is not in the list. Note that APP is case sensitive."
        exit 0
    fi

fi








