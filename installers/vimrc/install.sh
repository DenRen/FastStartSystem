#/bin/bash -x

CURRENT_DIR="$(dirname $0)"

save_old () {
    local path="$1"
    local name="$2"    

    local fullPath="${path}/${name}"

    if [ -e ${fullPath} ] || [ -L ${fullPath} ]; then
	    echo "Save old ${fullPath} in current dir: ${CURRENT_DIR}"
	    mv ${fullPath} ${CURRENT_DIR}/${name}_save
    fi
}


save_old ~ .vimrc
save_old ~ .gvimrc

curl -fLo ~/.vim/autoload/plug.vim \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install all necessaries programms
sudo apt install -y ripgrep fzf nodejs

cp "${CURRENT_DIR}"/.vimrc ~/.vimrc
ln -s ~/.vimrc ~/.gvimrc

echo
echo "Enter in all vims (vim, nvim, gvim) :PlugInstall"
