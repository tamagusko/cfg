#!/bin/sh

# Tiago Tamagusko 2022

# Install latex core
sudo pacman -Syy --noconfirm
sudo pacman -S --needed texlive-most --noconfirm

# install aur packages
PKGS_AUR=(
    pandoc
    pandoc-crossref-bin
    pandoc-eqnos
    pandoc-fignos
    pandoc-tablenos
)

for PKG in "${PKGS_AUR[@]}"; do
    echo "INSTALLING: ${PKG}"
    paru -S --noconfirm --needed "$PKG"
done

