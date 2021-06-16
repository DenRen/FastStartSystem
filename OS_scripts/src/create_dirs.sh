#!/bin/bash

# set -x # echo on

source $(dirname $0)/main_functions.sh

# Folders in Download folder
download_folder=$HOME/Downloads
download_folders="files/{temp,books,big_files,torrents} `
                 `programs/big_programs"

documents_folder=$HOME/Documents
documents_folders="GitHub"


# Set debug and verbose flag
init_base_flags $*

echo "Create folders"

for folders in $download_folders
do
    cmd="echo $download_folder/$folders | xargs mkdir -p"

    exec_cmd "$cmd"
done

for folders in $documents_folders
do
    cmd="echo $documents_folder/$folders | xargs mkdir -p"

    exec_cmd "$cmd"
done