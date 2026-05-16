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
ln -sfv $root/.zshrc ~

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
echo "Neovim"
echo "##############################"
echo ""

ln -sfv $root/nvim ~/.config/
nvim --headless -c "qa"

echo ""
echo "##############################"
echo "gdb"
echo "##############################"
echo ""

ln -sfv $root/gdb ~/.config/

echo ""
echo "##############################"
echo "tmux"
echo "##############################"
echo ""

ln -sfv $root/tmux ~/.config/

echo ""
echo "##############################"
echo "systemd"
echo "##############################"
echo ""

ln -sfv $root/systemd ~/.config/
systemctl --user enable --now tmux.service
loginctl enable-linger $USER

echo ""
echo "%%%%%"
echo "Done!"
echo "%%%%%"
