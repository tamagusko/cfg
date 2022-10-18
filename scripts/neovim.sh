#!/bin/sh

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "------------------------------------------------------------"
echo "Neovim configuration on Arch Linux v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo "------------------------------------------------------------"

echo
echo "CLEAN EXISTING NEOVIM FILES"
echo

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

echo
echo "INSTALL DEPENDENCIES"
echo

pip install -U pynvim
pip install pylint
pip install flake8
pip install vim-vint
pip install 'python-lsp-server[all]' pylsp-mypy pyls-isort
paru -S --noconfirm nodejs-lts-gallium
paru -S --noconfirm nodejs-lts-gallium ripgrep
sudo pacman -S --needed npm ctags --noconfirm
sudo npm install -g vim-language-server

echo
echo "NEOVIM CONFIGURATION"
echo

git clone --depth=1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
git clone --depth=1 https://github.com/jdhao/nvim-config.git ~/.config/nvim

echo
echo "COPILOT CONFIGURATION"
echo

git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim

echo
echo "CONFIGURATION COMPLETE! HAVE FUN!"
echo "-----------------------------------------------------------------"
echo "Run command ':PackerSync' on first neovim start to install plugins"
echo
echo "Run command ':Copilot setup' to active copilot"
echo "-----------------------------------------------------------------"

