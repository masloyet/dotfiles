#!/bin/bash

if ! command -v nvim &> /dev/null
then
    echo "nvim could not be found"
    exit
else
    echo "Setting up nvim config"
    mkdir -p ~/.config/nvim/lua/
    ln -sf `realpath init.vim` ~/.config/nvim/
    ln -sf `realpath lsp.lua` ~/.config/nvim/lua/
    ln -sf `realpath treesitter.lua` ~/.config/nvim/lua/
fi

echo "Installing vimplug"
source vimplug_nvim.sh

