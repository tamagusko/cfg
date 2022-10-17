#!/bin/sh

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "------------------------------------------------------------"
echo "Tensorflow Cuda Instalation on Arch Linux v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo "------------------------------------------------------------"

echo
echo "PIP INSTALATION"
echo

sudo pacman -S --needed python-pip --noconfirm

echo
echo "PYTORCH INSTALATION"
echo

## uncomment to install in a virtualenv
#pip install virtualenv
#python3 -m venv ~/venv/pytorch
#source ~/venv/pytorch/bin/activate
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
pip install tqdm

clear
echo
echo "--------------------------------------------------"
echo "PYTORCH INSTALLED! HAVE FUN!"
echo "--------------------------------------------------"

