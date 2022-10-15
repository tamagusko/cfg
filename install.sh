#!/bin/sh

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "---------------------------------------------------------"
echo "EndeavourOS Arch Linux i3 customization v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>                                    "
echo "---------------------------------------------------------"

echo "-----------------------------------------------------------"
echo "NOTE: install the EndeavorOs i3 before running this script "
echo "-----------------------------------------------------------"

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
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd .. 
rm -rf /paru

# install dependencies
echo
echo "INSTALLING EXTRA PACKAGES"
echo
PKGS=(
    maim # screenshot tool
    kitty # terminal
    ranger # terminal based file manager
    zsh 
    vim 
    nvim
    code
    python-pip
    papirus-icon-theme
    ufw # firewall 
    fzf
    zathura # pdf viewer
    btop # system info
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

# copy and load scripts
cp -r "$(pwd)/.config/" "~/.config/"
