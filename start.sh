#!/bin/bash

set -e

root="$(cd "$(dirname $0)" && pwd -P)"
user=$(whoami)

# Check dependencies.
errs=0
if ! command -v git 2>&1 > /dev/null; then
    echo "git not found"
    errs=1
elif ! command -v nvim 2>&1 > /dev/null; then
    echo "nvim not found"
    errs=1
elif ! command -v zsh 2>&1 > /dev/null; then
    echo "zsh not found"
    errs=1
elif ! command -v sed 2>&1 > /dev/null; then
    echo "sed not found"
    errs=1
fi

if [ $errs -eq 1 ]; then
    echo "install required packages"
    exit 1
fi

echo ""
echo "##############################"
echo "zsh"
echo "##############################"
echo ""

if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
else
    echo "omz already installed."
fi

ln -sfv $root/my-robby.zsh-theme ~/.oh-my-zsh/themes/
cp -v $root/.zshrc ~
sed -i '' -e "s:home:$HOME:" ~/.zshrc

echo ""
echo "##############################"
echo "Neovim"
echo "##############################"
echo ""

mkdir -pv ~/.config/nvim/lua/
ln -sfv $root/init.vim ~/.config/nvim/
ln -sfv $root/lsp.lua ~/.config/nvim/lua/
ln -sfv $root/treesitter.lua ~/.config/nvim/lua/

echo ""
echo "##############################"
echo "vimplug"
echo "##############################"
echo ""

. $root/vimplug_nvim.sh

echo ""
echo "##############################"
echo "fzf"
echo "##############################"
echo ""

if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
    echo "FZF already installed."
fi


echo ""
echo "##############################"
echo "gdb"
echo "##############################"
echo ""

ln -sfv $root/.gdbinit ~

echo ""
echo "##############################"
echo "tmux"
echo "##############################"
echo ""

ln -sfv $root/.tmux.conf ~

echo ""
echo "Done!"
echo ""
