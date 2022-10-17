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

# while true; do  
#     read -p "Install and configure Latex (y or n)? " yn  
#     case $yn in  
#         [Yy]* ) LATEX="true";;  
#         [Nn]* ) LATEX="false";;  
#         * ) echo "Please answer yes(y) or no(n).";;  
#     esac  
# done  
function yes_or_no_question {
    while true; do
        read -p "Install and configure $*? [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) return  1 ;;
        esac
    done
}

yes_or_no_question "Latex" && LATEX="true"
yes_or_no_question "Docker" && DOCKER="true"
yes_or_no_question "Pytorch" && PYTORCH="true"
yes_or_no_question "Tensorflow" && TENSORFLOW="true"


echo "---------------------------------------------------------"
echo $FOLDER
echo $LATEX
echo $DOCKER
echo $PYTORCH
echo $TENSORFLOW
