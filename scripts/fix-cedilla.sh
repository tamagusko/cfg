#!/bin/sh

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-16"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "---------------------------------------------------------"
echo "FIX CEDILLA ON ARCH LINUX v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo "---------------------------------------------------------"

sudo sed -i 's/"az:ca:co:fr:gv:oc:pt:sq:tr:wa"/"az:ca:co:fr:gv:oc:pt:sq:tr:wa:en"/' /usr/lib/gtk-2.0/2.10.0/immodules.cache
sudo sed -i 's/"az:ca:co:fr:gv:oc:pt:sq:tr:wa"/"az:ca:co:fr:gv:oc:pt:sq:tr:wa:en"/' /usr/lib/gtk-3.0/3.0.0/immodules.cache

sudo cp /usr/share/X11/locale/en_US.UTF-8/Compose /usr/share/X11/locale/en_US.UTF-8/Compose.bak
sed 's/ć/ç/g' < /usr/share/X11/locale/en_US.UTF-8/Compose | sed 's/Ć/Ç/g' > Compose
sudo mv Compose /usr/share/X11/locale/en_US.UTF-8/Compose

clear
echo
echo "----------------------------------------------------------"
echo "SCRIPT FINISHED!"
echo "ADD TWO LINES ON /etc/environment TO FINISH CONFIGURATION."
echo "GTK_IM_MODULE=cedilla"
echo "QT_IM_MODULE=cedilla"
echo "----------------------------------------------------------"
