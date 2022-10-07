# Under development

Just work configuration.

## Update system: 

sudo apt update && sudo apt upgrade or pacman -Syyu

## Install support apps

sudo apt install wget curl git -y

## Install nvidia driver

## Enable Firewall

## Fix cedilla

wget -q https://raw.githubusercontent.com/marcopaganini/gnome-cedilla-fix/master/fix-cedilla -O fix-cedilla
chmod 755 fix-cedilla
./fix-cedilla

5. Login Google

6. Login Firefox

7. Install ZSH

sudo apt install zsh -y
sudo chsh -s /usr/bin/zsh $USER

8. Install oh-my-zsh

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

9. install neovim
10. install https://github.com/NvChad/NvChad
11. install copilot
12. install apps: zoom, skype, slack, dropbox, teams
13. install pomodoro: https://github.com/Splode/pomotroid/releases
14. install range
15. configuration of shortcuts:
  - mod+ (left, up, down, right): tile windows
  - alt+left: left workspace
  - alt+right: right workspace
  - ctrl+left: move to left workspace
  - ctrl+right: move to right workspace
  - ctrl+alt+f: Firefox
  - ctrl+alt+e: File Manager
  - ctrl+alt+t: terminal
  - ctrl+alt+p: pomodoro
  - mod+r: ranger
  - ctrl+q: close apps
