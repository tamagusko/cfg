#!/bin/sh

# WARNING: For personal use only, use at your own risk.

VERSION="0.1.0"
DATE="2022-10-15"
AUTHOR="Tiago Tamagusko"
CONTACT="tamagusko@gmail.com"

echo "------------------------------------------------------------"
echo "ZSH configuration on Arch Linux v$VERSION ($DATE)"
echo "by $AUTHOR <$CONTACT>"
echo "------------------------------------------------------------"

echo
echo "INSTALL ZSH"
echo

sudo pacman -Syu --noconfirm
sudo pacman -S --needed zsh fzf --noconfirm

echo
echo "INSTALL OH-MY-ZSH"
echo

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

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
echo "alias vmk38='python3.8 -m venv venv'"
echo "alias py38=python3.8"

# add plugins to zsh
sudo sed -i 's/plugins=(git)/plugins=(git sudo vscode gitfast command-not-found gitignore heroku taskwarrior fzf zsh-syntax-highlighting zsh-autosuggestions colored-man-pages virtualenv)/' ~/.zshrc

# clone missed plugins
cd ~/.oh-my-zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions

echo
echo "INSTALL POWERLEVEL10k"
echo

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc

echo "--------------------------"
echo "ZSH CONFIGURED! HAVE FUN!"
echo "--------------------------"
