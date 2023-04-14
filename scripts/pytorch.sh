#!/bin/sh

# Tiago Tamagusko 2023

sudo pacman -S --needed python-pip --noconfirm
sudo paru -S --noconfirm --needed python-pytorch-cuda
pip install torchvision torchaudio

# if you choose torch 1.13
# pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
