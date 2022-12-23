#!/bin/sh

# Tiago Tamagusko 2022

sudo pacman -S --needed python-pip --noconfirm
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

