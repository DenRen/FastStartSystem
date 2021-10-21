#!/bin/bash

sudo apt-get remove -y neovim

rm -rf ~/.config/nvim
rm ~/.local/share/nvim/site/autoload/plug.vim
