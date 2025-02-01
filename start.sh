#!/bin/bash

set -e

root="$(cd "$(dirname $0)" && pwd -P)"

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
sed -i '' -e "s/home/$HOME/" ~/.zshrc

echo ""
echo "##############################"
echo "Neovim"
echo "##############################"
echo ""

mkdir -pv               ~/.config/nvim/
ln -sfv $root/init.vim  ~/.config/nvim/
ln -sfv $root/lua       ~/.config/nvim/
ln -sfv $root/ftplugin  ~/.config/nvim/

nvim +PlugInstall +qall

echo ""
echo "##############################"
echo "vimplug"
echo "##############################"
echo ""

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
ln -sfv $root/.ignore ~


echo ""
echo "##############################"
echo "gdb"
echo "##############################"
echo ""

mkdir -pv               ~/.config/gdb/
ln -sfv $root/gdbinit   ~/.config/gdb/

echo ""
echo "##############################"
echo "tmux"
echo "##############################"
echo ""

mkdir -pv               ~/.config/tmux/
ln -sfv $root/tmux.conf ~/.config/tmux/

echo ""
echo "%%%%%"
echo "Done!"
echo "%%%%%"
