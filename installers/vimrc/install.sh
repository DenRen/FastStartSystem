#/bin/bash

CURRENT_DIR="$(dirname $0)"

if [ -e "~/.vimrc" ]; then
	echo "Save old .vimrc in current dir: ${CURRENT_DIR}"
	cp ~/.vimrc "${CURRENT_DIR}"/.vimrc_save
fi

curl -fLo ~/.vim/autoload/plug.vim \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp "${CURRENT_DIR}"/.vimrc ~/.vimrc

echo -e "\nEnter in nvim :PlugInstall"
