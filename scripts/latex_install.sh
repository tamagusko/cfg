#!/bin/sh

#!/bin/bash

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "---------------------------------------------------------"
echo "Latex Instalation on Arch Linux v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo "---------------------------------------------------------"

# Install latex core
echo
echo "LATEX INSTALATION"
echo

sudo pacman -Syy
sudo pacman -S texlive-most --noconfirm

# install aur packages
echo
echo "INSTALLING AUR PACKAGES"
echo

PKGS_AUR=(
    pandoc
    pandoc-crossref-bin
    pandoc-eqnos
    pandoc-fignos
    pandoc-tablenos
)

for PKG in "${PKGS_AUR[@]}"; do
    echo "INSTALLING: ${PKG}"
    paru -S --noconfirm "$PKG"
done

echo
echo "LATEX INSTALLED! HAVE FUN!"
echo


