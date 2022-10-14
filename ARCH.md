# Under development

Simple Arch configuration.

## update system:

sudo pacman -Syyu

## install support apps

sudo pacman -S wget curl git zsh vim python-pip ufw fzf --noconfirm

## install paru

sudo pacman -S --needed base-devel  
git clone https://aur.archlinux.org/paru.git  
cd paru  
makepkg -si  

## install nvidia driver

sudo pacman -S nvidia nvidia-utils nvidia-settings

## enable Firewall

sudo systemctl enable ufw --now  
systemctl status ufw  
sudo ufw enable

## login Google

## login Firefox

## fix cedilla (TODO)

1. Put: English(US, internacional) on your system keyboard layout.

2. Edite files
sudo vim /usr/lib/gtk-3.0/3.0.0/immodules.cache  
sudo vim /usr/lib/gtk-2.0/2.10.0/immodules.cache

changing the line:

"cedilla" "Cedilla" "gtk20" "/usr/share/locale" "az:ca:co:fr:gv:oc:pt:sq:tr:wa"

to

"cedilla" "Cedilla" "gtk20" "/usr/share/locale" "az:ca:co:fr:gv:oc:pt:sq:tr:wa:en"

3. replacing "ć" to "ç" and "Ć" to "Ç" on /usr/share/X11/locale/en_US.UTF-8/Compose

sudo cp /usr/share/X11/locale/en_US.UTF-8/Compose /usr/share/X11/locale/en_US.UTF-8/Compose.bak  
sed 's/ć/ç/g' < /usr/share/X11/locale/en_US.UTF-8/Compose | sed 's/Ć/Ç/g' > Compose  
sudo mv Compose /usr/share/X11/locale/en_US.UTF-8/Compose

4. add two lines on /etc/environment

GTK_IM_MODULE=cedilla  
QT_IM_MODULE=cedilla

5.restart your computer

## install ZSH
  
chsh -s $(which zsh)

Log out and login

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
    taskwarrior  
    fzf  
    zsh-syntax-highlighting
    zsh-autosuggestions  
    colored-man-pages  
    virtualenv
)

alias cd..='cd ..'  
alias h="history"  
alias lvim=/home/t1/.local/bin/lvim
alias svi='sudo vim'  
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

paru papirus

## install neovim:

sudo pacman -S neovim python-neovim xclip

## configuration:

https://github.com/jdhao/nvim-config

## install copilot

https://github.com/github/copilot.vim

## install apps: zoom, skype, slack, dropbox, teams

### XFCE
- alt+left: left workspace
- alt+right: right workspace
- ctrl+left: move to left workspace
- ctrl+right: move to right workspace
- super+up: maximize
- super+down: hide
- super+f: fullscreen
- super+left: tile left
- super+left: tile right
- ctrl+super+pg up: top left
- super+pg up: top right
- ctrl+super+pg down: bottom left
- super+pg down: bottom right
- super+1: workspace 1
- super+2: workspace 2
- mod+b and ctrl+alt+f: Firefox
- mod+n and ctrl+alt+e: File Manager
- mod+enter and ctrl+alt+t: terminal
- ctrl+q: close apps (window manager)
- ctrl+alt+s: screenshot region

# Window Manager Tweaks

Cycle all workspaces

# Fix system font
Default: Noto Sans Regular  
Mono: Noto Sans Mono Regular  
