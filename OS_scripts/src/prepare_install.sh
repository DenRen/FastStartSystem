#!/bin/bash

source $(dirname $0)/main_functions.sh

# Set debug and verbose flag
init_base_flags $*

#echo "debg: $debug"
#echo "verb: $verbose"

upgrade_all () {
    local name="Upgrade already installed programs"
    local cmd="
    sudo apt-get update;   
    sudo apt-get upgrade -y;
    "

    install_cmd "$name" "$cmd"
}

upgrade_all