#!/bin/sh

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-18"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "------------------------------------------------------------"
echo "Ghostwriter configuration v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo "------------------------------------------------------------"

echo
echo "INSTALL DRACULA THEME"
echo

git clone https://github.com/dracula/ghostwriter.git

mkdir -p ~/.config/ghostwriter/themes && cp ghostwriter/Dracula.json ~/.config/ghostwriter/themes/Dracula.json
rm -rf ghostwriter

echo "-----------------------------------------------------------------"
echo "GHOSTWRITER CONFIGURED!"
echo "-----------------------------------------------------------------"

