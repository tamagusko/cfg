#!/bin/sh

# Tiago Tamagusko 2022

# Install zsh
sudo pacman -Syu --noconfirm
sudo pacman -S --needed zsh fzf --noconfirm

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Set zsh as default
chsh -s /bin/zsh

# add aliases to zsh
echo "alias cd..='cd ..'" >>~/.zshrc
echo "alias h=history" >>~/.zshrc
echo "alias vi=nvim" >>~/.zshrc
echo "alias svi='sudo vim'" >>~/.zshrc
echo "alias srun='python3 -m uvicorn --port 5000 --host 127.0.0.1 main:app --reload'" >>~/.zshrc
echo "alias gitignorebig='find . -size +100M | cat >> .gitignore'" >>~/.zshrc
echo "alias vac='source venv/bin/activate'" >>~/.zshrc
echo "alias vmk='python3 -m virtualenv .venv'" >>~/.zshrc
echo "alias python=python3" >>~/.zshrc
echo "alias vmk39='python3.9 -m venv venv'" >>~/.zshrc
echo "alias py39=python3.9" >>~/.zshrc
echo "# export PATH=/opt/anaconda/bin:$PATH"

# set capslock as escape
echo "setxkbmap -layout us -option caps:escape"

# add plugins to zsh
sudo sed -i 's/plugins=(git)/plugins=(git sudo vscode gitfast command-not-found gitignore heroku taskwarrior fzf zsh-syntax-highlighting zsh-autosuggestions colored-man-pages virtualenv)/' ~/.zshrc

# clone missed plugins
cd ~/.oh-my-zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc
