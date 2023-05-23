#!/bin/sh

root="$(cd "$(dirname $0)" && pwd -P)"

if ! command -v nvim 2>&1 > /dev/null
then
    echo "nvim could not be found"
    exit
else
    echo "Setting up nvim config"
    mkdir -p ~/.config/nvim/lua/
    ln -sf $root/init.vim ~/.config/nvim/
    ln -sf $root/lsp.lua ~/.config/nvim/lua/
    ln -sf $root/treesitter.lua ~/.config/nvim/lua/
fi

echo "Installing vimplug"
. $root/vimplug_nvim.sh

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

