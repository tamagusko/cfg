# Under development

Simple  ubuntu/mint cfg to use at work.

## Update system: 

sudo apt update && sudo apt upgrade

## Install support apps

sudo apt install wget curl git -y

## Install nvidia driver

## Enable Firewall

## Fix cedilla

wget -q https://raw.githubusercontent.com/marcopaganini/gnome-cedilla-fix/master/fix-cedilla -O fix-cedilla  
chmod 755 fix-cedilla  
./fix-cedilla

## Login Google

## Login Firefox

## Install ZSH

sudo apt install zsh -y  
chsh -s $(which zsh)

just log out and login

## Install oh-my-zsh

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

## add plugins and alias do zsh:

plugins=(
    git
    sudo
    vscode
    gitfast
    command-not-found
    gitignore
    heroku
    fzf
    zsh-syntax-highlighting
    zsh-autosuggestions
    colored-man-pages
    virtualenv
)

alias cd..='cd ..'  
alias h="history"  
alias vi=nvim  
alias svi='sudo vim'  
alias srun='python3 -m uvicorn --port 5000 --host 127.0.0.1 main:app --reload'  
alias yolov5env="source /home/t1/Downloads/yolov5_training_env/bin/activate"  
alias yolorenv="source /home/t1/Downloads/yolor_env/bin/activate"  
alias gitignorebig="find . -size +100M | cat >> .gitignore"  
alias vac="source venv/bin/activate"  
alias vmk="python3 -m virtualenv .venv"  
alias python=python3

## add missing plugins

sudo apt install fzf  
cd ~/.oh-my-zsh/plugins/  
git clone https://github.com/zsh-users/zsh-syntax-highlighting  
git clone https://github.com/zsh-users/zsh-autosuggestions

## install powerlevel10k

https://github.com/romkatv/powerlevel10k

## install Papirus icons:

sudo add-apt-repository ppa:papirus/papirus  
sudo apt update && sudo apt install papirus-icon-theme

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
  - ctrl+q: close apps (window manager)
