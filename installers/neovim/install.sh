#!/bin/bash

sudo apt-get install -y neovim
curl 	-fLo ~/.local/share/nvim/site/autoload/plug.vim \
	--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
