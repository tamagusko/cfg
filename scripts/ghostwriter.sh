#!/bin/sh

# Tiago Tamagusko 2022

git clone https://github.com/dracula/ghostwriter.git

mkdir -p ~/.config/ghostwriter/themes && cp ghostwriter/Dracula.json ~/.config/ghostwriter/themes/Dracula.json
rm -rf ghostwriter

