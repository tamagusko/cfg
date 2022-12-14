#!/bin/sh

# Tiago Tamagusko 2022

# Install nvidia driver
paru -S --noconfirm --needed nvidia-inst 
sudo nvidia-inst

# Install cuda
sudo paru -S --noconfirm --needed python-tensorflow-cuda
