#!/bin/bash

# $1 - command for execute
# Global options: debug, verbose
exec_cmd () {
    local cmd=$1

    if [ $debug -eq 1 ]
    then                    # Debug: ON
        echo $cmd
        echo ""
    else                    # Debug: OFF
        if [ $verbose -eq 1 ]
        then
            eval "$cmd"
        else
            eval "$cmd" > /dev/null
        fi
    fi 
}

exec_name_cmd () {
    local cmd=$2
    local name=$1

    echo "$name"

    exec_cmd "$cmd"
}

# $1 - name
# $2 - command for install prog with $name
# Global options: debug, verbose
install_cmd () {
    local cmd=$2
    local name=$1

    echo "Install: $name"

    exec_cmd "$cmd"
}

init_base_flags () {
    debug=0
    verbose=0
    while getopts ":dv" opt
    do
        case $opt in
            d) debug=1   ;;     # Debug:   ON
            v) verbose=1 ;;     # Verbose: ON
        esac
    done
}

check_base_flags () {
    flag=$1
    case $flag in
        d) debug=1   ;;     # Debug:   ON
        v) verbose=1 ;;     # Verbose: ON
    esac
}