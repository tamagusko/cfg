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

# Install nvidia driver
echo
echo "NVIDIA DRIVER INSTALATION"
echo

sudo paru -S --noconfirm --needed nvidia-inst 
sudo nvidia-inst

# Install cuda
echo
echo "TENSORFLOW/CUDA INSTALATION"
echo

sudo paru -S --noconfirm --needed python-tensorflow-cuda

clear
echo
echo "--------------------------------------------------"
echo "NVIDIA, CUDA, AND TENSORFLOW INSTALLED! HAVE FUN!"
echo "--------------------------------------------------"
