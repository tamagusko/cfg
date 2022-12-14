#!/bin/sh

# Tiago Tamagusko 2022

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

pip install -U pynvim
pip install pylint
pip install flake8
pip install vim-vint
pip install 'python-lsp-server[all]' pylsp-mypy pyls-isort
paru -S --noconfirm --needed npm ctags nerd-fonts-fira-code nodejs-lts-gallium ripgrep
sudo npm install -g vim-language-server

git clone --depth=1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
git clone --depth=1 https://github.com/jdhao/nvim-config.git ~/.config/nvim
# set capslock as escape
echo "setxkbmap -option 'caps:escape'" >>~/.zshrc

git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim

echo "-----------------------------------------------------------------"
echo "Run command ':PackerSync' on first neovim start to install plugins"
echo
echo "Run command ':Copilot setup' to active copilot"
echo "-----------------------------------------------------------------"

