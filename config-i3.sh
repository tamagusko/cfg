#!/bin/bash

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

# TODO:

# 1. Fix cedilla (implement bash)
# 2. Install zsh, configure zsh, oh-my-zsh, and powerlevel10k
# 3. Configure neovim and install copilot
# 4. Install latex

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
rm -rf "/opt/paru"

# install dependencies
echo
echo "INSTALLING EXTRA (PACMAN) PACKAGES"
echo

PKGS=(
    maim # screenshot tool
    kitty # terminal
    ranger # terminal based file manager
    zsh 
    vim 
    neovim
    python-neovim
    code
    cronie # cron implementation on archlinux
    python-pip
    papirus-icon-theme
    ufw # firewall 
    fzf
    zathura # pdf viewer
    btop # system info (htop alternative)
    # acpi_call only on thinkpad
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# install aur packages
echo
echo "INSTALLING AUR PACKAGES"
echo

PKGS_AUR=(
    zathura-djvu
    zathura-cb
    zathura-pdf-mupdf
    zathura-ps
    zoom
    teams
    slack-desktop
    skypeforlinux-stable-bin
    texstudio
    ghostwriter
)

for PKG in "${PKGS_AUR[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo paru -S --noconfirm "$PKG"
done

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

cd "/opt"
git clone https://github.com/tamagusko/linux-cfg.git
cd "linux-cfg"
cp -r "/dotfiles/" "~/.config/"
rm -rf "/opt/linux-cfg"

# copy and load scripts
echo
echo "CREATING USER FOLDERS"
echo

mkdir ~/repos
mkdir ~/venv

clear

echo
echo "NEXT STEPS TO FINISH THE CONFIGURATION"
echo

STEPS=(
    "STEP 1) Login Google and Firefox"
    "STEP 2) Fix cedilla"
    "STEP 3) Install zsh, oh-my-zsh, and powerlevel10k"
    "STEP 4) Configure zsh"
    "STEP 5) Configure neovim"
    "See docs/ARCH.md for details"
)

for STEP in "${STEPS[@]}"; do
    echo ${STEP}
done

echo
echo "INSTALATION PROCESS DONE! HAVE FUN!"
echo
