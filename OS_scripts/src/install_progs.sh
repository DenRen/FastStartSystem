#!/bin/bash

# set -x

# Install program for programming

# Options: (./install_progs -dtap)
# d - debug
# a - asm
# o - other and VS Code
# p - programming
# t - telegram
# n - auto enable num lock
# q - QOwnNotes

source $(dirname $0)/main_functions.sh

progs_prog="g++ vim make cmake git ctags"
progs_other="translate-shell tlp"
progs_asm="binutils nasm radare2"

install_telegram () {
    local name="Telegram"    
    local cmd="
    sudo add-apt-repository ppa:atareao/telegram -y 2> /dev/null;
    sudo apt-get update;
    sudo apt-get install telegram -y;"

    install_cmd "$name" "$cmd"
}

# Enable autostart Num Lock
install_auto_num_lock () {
    local name="Autostart Num Lock"
    local cmd="
    sudo apt-get install numlockx -y;
    sudo bash -c \"sudo echo 'greeter-setup-script=/usr/bin/numlockx on'\
                   >> /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf;\"
    "
    
    install_cmd "$name" "$cmd"
}

# $1 - names of programs. F.e.: vim g++ make
install_std_prog () {
    local names_programs=$1
    local cmd="sudo apt-get install $names_programs -y"

    install_cmd "$names_programs" "$cmd"
}

install_github_desktop () {
    local name="Github Desktop"
    local cmd="firefox 'https://github.com/shiftkey/desktop/releases' 2> /dev/null &"

    install_cmd "$name" "$cmd"
}

install_qownnotes () {
    local name="QOwnNotes"
    local cmd="
    sudo add-apt-repository ppa:pbek/qownnotes -y 2> /dev/null;
    sudo apt-get update;
    sudo apt-get install qownnotes -y"

    install_cmd "$name" "$cmd"
}

install_zsh () {
    # Install zsh ---------------------------------------------------------------------------

    local name="ZSH"
    local cmd='
    sudo apt-get install git zsh -y;

    echo "Please, enter Enter"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
    
    chsh -s $(which zsh)
    echo "Reboot and you will have the default ZSH"'

    install_cmd "$name" "$cmd"

    # Change theme --------------------------------------------------------------------------
    local name="Change theme in ZSH"
    local cmd="
    sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"bira\"/' /home/$USER/.zshrc"
    
    exec_name_cmd "$name" "$cmd"
}

set_aliases_for_bash_zsh () {
    local name="Set aliases for bash and zsh"
    local name_baserc=".basebashrc"
    
    local path_folder="$HOME"

    # Not change this tab
    # It's special tab = 0
    local bash_add_cmd="
# Include personal aliases;\n
source $path_folder/$name_baserc";
    
    local cmd='
    cp "$(dirname $0)/$name_baserc" "$path_folder/$name_baserc";

    echo "$bash_add_cmd" >> $path_folder/.bashrc;
    echo "$bash_add_cmd" >> $path_folder/.zshrc;'

    exec_name_cmd "$name" "$cmd"
}

# $1 - string error
error_exit () {
    local str_err=$1
    echo "$1"
    exit -1
}

install_manager () {
    opt=$1

    case $opt in
        a) install_std_prog "$progs_asm"    ;;
        o) install_std_prog "$progs_other" 
        install_github_desktop              ;;
        p) install_std_prog "$progs_prog"   ;;
        t) install_telegram                 ;;
        n) install_auto_num_lock            ;;
        q) install_qownnotes                ;;
        z) install_zsh                      ;;
        s) set_aliases_for_bash_zsh         ;;
        d) check_base_flags $opt            ;;
        v) check_base_flags $opt            ;;
        *) error_exit "Incorrect option"
    esac
}

debug=0
verbose=0
while getopts "dvaoptnqzs" type_progs
do
    install_manager $type_progs
done