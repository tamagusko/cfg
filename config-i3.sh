#!/bin/bash

# WARNING: For personal use only, use at your own risk.

# This is not a minimal install. This is my customized installation.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

# Run all extra scripts in the scripts folder? This can take quite a while.
RUNALL="true"

# TODO:

# 1. Fix cedilla (implement bash)
# 2. Install zsh, configure zsh, oh-my-zsh, and powerlevel10k (implement)

echo "---------------------------------------------------------"
echo "Arch Linux i3 customization v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo 
echo "NOTE: install EndeavorOs i3 before running this script "
echo "---------------------------------------------------------"

# update packages
echo
echo "UPDATING PACKAGES"
echo

sudo pacman -S archlinux-keyring && sudo pacman -Syu

# paru installation
echo
echo "INSTALLING PARU"
echo

sudo pacman -S --needed git base-devel --noconfirm
cd /opt
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd .. 
rm -rf /opt/paru

# install dependencies
echo
echo "INSTALLING EXTRA (PACMAN) PACKAGES"
echo

xargs sudo pacman -S < packages.txt --noconfirm --needed

# install aur packages
echo
echo "INSTALLING AUR PACKAGES"
echo

xargs paru -S --noconfirm --needed < packages-AUR.txt 

# secure issues
echo "-------------------------------------------------"
echo "Secure Linux                                     "
echo "-------------------------------------------------"

## enable Firewall
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable

systemctl enable ufw
systemctl start ufw

# --- Harden /etc/sysctl.conf
sysctl kernel.modules_disabled=1
sysctl -a
sysctl -A
sysctl mib
sysctl net.ipv4.conf.all.rp_filter
sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'

## nvidia drivers
echo
echo "INSTALL NVIDIA DRIVERS"
echo

sudo pacman -S nvidia nvidia-dkms nvidia-utils nvidia-settings

# copy and load scripts
echo
echo "LOADING CONFIGURATION"
echo

mkdir ~/repos
cd ~/repos
git clone https://github.com/tamagusko/linux-cfg.git
cd linux-cfg
cp -r ~/repos/linux-cfg/dotfiles/* ~/.config/

clear

# FINAL STEPS TO FINISH THE INSTALATION

# See RUNALL in line 13.
if $RUNALL
then
  echo
  echo "INSTALLING EXTRA SCRIPTS"
  echo
  
  for f in ~/repos/scripts/*.sh; do  # execute all scripts
    bash "$f" || break  # execute successfully or break
  done

else
  echo
  echo "NEXT STEPS TO FINISH THE CONFIGURATION"
  echo

  STEPS=(
    "STEP 1) Login Google and Firefox"
    "STEP 2) Fix cedilla (scripts/fix-cedilla.sh)"
    "STEP 3) Install zsh, oh-my-zsh, and powerlevel10k (scripts/zsh-config.sh)"
    "STEP 4) Configure neovim (scripts/neovim-config.sh)"
    "STEP 5) Latex installation (scripts/latex-install.sh)"
    "See docs/ARCH-i3wm.md for details"
  )
  for STEP in "${STEPS[@]}"; do
    echo ${STEP}
  done
fi

echo
echo "INSTALATION PROCESS DONE! HAVE FUN!"
echo
