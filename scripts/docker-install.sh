#!/bin/sh

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-17"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "------------------------------------------------------------"
echo "Docker Instalation on Arch Linux v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo "------------------------------------------------------------"

echo
echo "DOCKER INSTALATION"
echo

sudo pacman -Syu
sudo paru -S --noconfirm docker 
sudo docker version

echo
echo "ENABLE DOCKER"
echo

sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

clear
echo
echo "--------------------------------------------------"
echo "DOCKER INSTALLED! REBOOT TO USE. HAVE FUN!"
echo "--------------------------------------------------"
