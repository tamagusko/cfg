#!/bin/bash

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

I3WM="false"
LATEX="false"
DOCKER="false"
PYTORCH="false"
TENSORFLOW="false"

# functions
function yes_or_no_question {
    while true; do
        read -p "Install and configure $*? [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) return  1 ;;
        esac
    done
}

function echo_message {
    echo "---------------------------------------------------------"
    echo "$*"
    echo "---------------------------------------------------------"
}

# init of script
echo "---------------------------------------------------------"
echo "ARCH Linux i3 customization v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo 
echo "NOTE: install EndeavorOs i3 before running this script "
echo "---------------------------------------------------------"

# ask for extra packages to install
yes_or_no_question "i3wm" && I3WM="true"
yes_or_no_question "Latex" && LATEX="true"
yes_or_no_question "Docker" && DOCKER="true"
yes_or_no_question "Pytorch" && PYTORCH="true"
yes_or_no_question "Tensorflow" && TENSORFLOW="true"

echo_message "UPDATING PACMAN PACKAGES"
sudo pacman -S --needed archlinux-keyring && sudo pacman -Syu --noconfirm

# only runs if paru is not installed
if ! paru --version ; then
    echo_message "INSTALLING PARU"
    FOLDER=$(pwd)
    sudo pacman -S --needed git base-devel --noconfirm
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    sudo rm -rf $FOLDER/paru
fi

echo_message "CLONE CONFIGURATION REPOSITORY"
mkdir ~/repos
cd ~/repos
git clone https://github.com/tamagusko/linux-cfg.git
cd linux-cfg

echo_message "INSTALLING PACMAN PACKAGES"
xargs sudo pacman -S --needed < packages.txt --noconfirm 

echo_message "INSTALLING AUR PACKAGES"
xargs paru -S --noconfirm --needed < packages-AUR.txt 

echo_message "ENABLE FIREWALL"
## enable Firewall
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
sudo systemctl enable ufw
sudo systemctl start ufw

## nvidia drivers
#echo_message "INSTALL NVIDIA DRIVERS"
#echo 
#echo

#sudo pacman -S nvidia nvidia-dkms nvidia-utils nvidia-settings

# i3wm instalation
if I3WM; then
  echo_message "LOADING CONFIGURATION FILES"
  cp -r ~/repos/cfg/dotfiles/* ~/.config/
fi

# copy all generic configs
cp -r ~/repos/cfg/dotfiles/* ~/.config/

echo_message "INSTALLING EXTRA SCRIPTS"
sh ~/repos/cfg/scripts/fix-cedilla.sh
sh ~/repos/cfg/scripts/zsh.sh
sh ~/repos/cfg/scripts/neovim.sh
sh ~/repos/cfg/scripts/ghostwriter.sh

if $LATEX; then
  sh ~/repos/cfg/scripts/latex.sh
fi
  
if $DOCKER; then
  sh ~/repos/cfg/scripts/docker.sh
fi

if $TENSORFLOW; then
  sh ~/repos/cfg/scripts/tensorflow-cuda.sh
fi

if $PYTORCH; then
  sh ~/repos/cfg/scripts/pytorch.sh
fi

echo_message "BACKUP OF INSTALLATION SCRIPTS ~/repos/cfg"

echo_message "INSTALLATION COMPLETED"
