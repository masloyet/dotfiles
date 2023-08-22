#!/bin/sh

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

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp -v $root/.zshrc ~
sed -i "s#<home>#$HOME#" ~/.zshrc
# Copy here as .zshrc tends to have host-specific modifications.
echo "Changing default shell..."
chsh -s $(which zsh)

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

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

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
