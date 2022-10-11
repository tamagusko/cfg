# Under development

Simple  ubuntu/mint cfg to use at work.

# TODO: 

add gnome shortcuts

## update system: 

sudo apt update && sudo apt upgrade

## install support apps

sudo apt install wget curl git -y

## install nvidia driver

## enable Firewall

## fix cedilla

wget -q https://raw.githubusercontent.com/marcopaganini/gnome-cedilla-fix/master/fix-cedilla -O fix-cedilla  
chmod 755 fix-cedilla  
./fix-cedilla

## login Google

## login Firefox

## install ZSH

sudo apt install zsh -y  
chsh -s $(which zsh)

just log out and login

## install oh-my-zsh

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
alias svi='sudo nvim'  
alias srun='python3 -m uvicorn --port 5000 --host 127.0.0.1 main:app --reload'  
alias yolov5env="source /home/t1/Downloads/yolov5_training_env/bin/activate"  
alias yolorenv="source /home/t1/Downloads/yolor_env/bin/activate"  
alias gitignorebig="find . -size +100M | cat >> .gitignore"  
alias vac="source venv/bin/activate"  
alias vmk="python3 -m virtualenv .venv"  
alias python=python3

## add missing plugins

sudo apt install fzf -y
cd ~/.oh-my-zsh/plugins/  
git clone https://github.com/zsh-users/zsh-syntax-highlighting  
git clone https://github.com/zsh-users/zsh-autosuggestions

## install powerlevel10k

https://github.com/romkatv/powerlevel10k

## install Papirus icons:

sudo add-apt-repository ppa:papirus/papirus  
sudo apt update && sudo apt install papirus-icon-theme

## install nodejs

https://computingforgeeks.com/how-to-install-node-js-on-ubuntu-debian/

## install neovim or vim 9:

### neovim:

Download appimage on:
https://github.com/neovim/neovim/releases/tag/stable
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin 
cd /usr/local/bin 
sudo mv nvim.appimage nvim

https://github.com/jdhao/nvim-config

### vim: 

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim -y
sudo apt install vim-gtk -y
https://github.com/amix/vimrc

## install copilot

https://github.com/github/copilot.vim


## install apps: zoom, skype, slack, dropbox, teams

## configuration of shortcuts:

### Gnome


### XFCE
- mod+ (left, up, down, right): tile windows
- alt+left: left workspace
- alt+right: right workspace
- ctrl+left: move to left workspace
- ctrl+right: move to right workspace
- mod+b: Firefox
- mod+n: File Manager
- mod+enter: terminal
- ctrl+q: close apps (window manager)
