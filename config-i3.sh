#!/bin/bash

# WARNING: For personal use only, use at your own risk.

# This is not a minimal install. This is my customized installation.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

FOLDER=$(pwd)
LATEX="false"
DOCKER="false"
PYTORCH="false"
TENSORFLOW="false"

echo "---------------------------------------------------------"
echo "ARCH Linux i3 customization v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo 
echo "NOTE: install EndeavorOs i3 before running this script "
echo "---------------------------------------------------------"

while true; do  
    read -p "Install and configure Latex (y or n)? " yn  
    case $yn in  
        [Yy]* ) LATEX="true";;  
        [Nn]* ) LATEX="false";;  
        * ) echo "Please answer yes(y) or no(n).";;  
    esac  
done  

while true; do  
    read -p "Install and configure Docker (y or n)? " yn  
    case $yn in  
        [Yy]* ) DOCKER="true";;  
        [Nn]* ) DOCKER="false";;  
        * ) echo "Please answer yes(y) or no(n).";;  
    esac  
done  

while true; do  
    read -p "Install and configure Tensorflow (y or n)? " yn  
    case $yn in  
        [Yy]* ) TENSORFLOW="true";;  
        [Nn]* ) TENSORFLOW="false";;  
        * ) echo "Please answer yes(y) or no(n).";;  
    esac  
done  

while true; do  
    read -p "Install and configure Pytorch (y or n)? " yn  
    case $yn in  
        [Yy]* ) PYTORCH="true";;  
        [Nn]* ) PYTORCH="false";;  
        * ) echo "Please answer yes(y) or no(n).";;  
    esac  
done  

echo
echo "UPDATING PACKAGES"
echo

sudo pacman -S --needed archlinux-keyring && sudo pacman -Syu --noconfirm

echo
echo "INSTALLING PARU"
echo

sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
sudo rm -rf $FOLDER/paru

echo
echo "CLONE CONFIGURATION REPOSITORY"
echo

mkdir ~/repos
cd ~/repos
git clone https://github.com/tamagusko/linux-cfg.git
cd linux-cfg

echo
echo "INSTALLING EXTRA (PACMAN) PACKAGES"
echo

xargs sudo pacman -S --needed < packages.txt --noconfirm 

echo
echo "INSTALLING AUR PACKAGES"
echo

xargs paru -S --noconfirm --needed < packages-AUR.txt 

echo "-------------------------------------------------"
echo "Secure Linux                                     "
echo "-------------------------------------------------"

## enable Firewall
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable

sudo systemctl enable ufw
sudo systemctl start ufw

# --- Harden /etc/sysctl.conf
sysctl kernel.modules_disabled=1
sysctl -a
sysctl -A
sysctl mib
sudo sysctl net.ipv4.conf.all.rp_filter
sudo sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'

## nvidia drivers
#echo
#echo "INSTALL NVIDIA DRIVERS"
#echo

#sudo pacman -S nvidia nvidia-dkms nvidia-utils nvidia-settings

echo
echo "LOADING CONFIGURATION"
echo

cp -r ~/repos/linux-cfg/dotfiles/* ~/.config/

echo
echo "INSTALLING EXTRA SCRIPTS"
echo

sh ~/repos/linux-cfg/scripts/fix-cedilla.sh
sh zsh-config.sh
sh neovim-config.sh

if LATEX
then
  sh ~/repos/linux-cfg/scripts/latex-install.sh
fi
  
if DOCKER
then
  sh ~/repos/linux-cfg/scripts/docker-install.sh
fi

if TENSORFLOW
then
  sh ~/repos/linux-cfg/scripts/tensorflow-cuda-install.sh
fi

if PYTORCH
then
  sh ~/repos/linux-cfg/scripts/pytorch-install.sh
fi

echo
echo "BACKUP OF INSTALLED FILES ON ~/repos/linux-cfg"
echo "INSTALLATION PROCESS DONE! HAVE FUN!"
echo
