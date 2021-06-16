#!/bin/bash

src_folder="./src"

print_help () {
    echo "This script upgrade you system. He install main programs"
    echo ""
    echo "Options:"
    echo "-d - debug (Only simulates a system upgrade, but doesn't run anything)"
    echo "-v - verbose output (shows all output)"
}

# Set params (debug flag, verbose)
debug_flag=
verbose_flag=
while getopts ":hdv" opt
do
    case $opt in
        d) debug_flag=-d    ;;  # Debug:   ON
        v) verbose_flag=-v  ;;  # Verbose: ON
        h) print_help
           exit 1           ;;
    esac
done

flags="$debug_flag $verbose_flag"

$src_folder/prepare_install.sh $flags
$src_folder/create_dirs.sh     $flags
$src_folder/install_progs.sh   $flags -npzsotq # programming, other, noasm, ...