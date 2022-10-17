# Todo:

1. modularize.
2. add menu.
3. refactor.
4. install without endeavourOS layer.

Example of menu:

while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

source: https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script

## Arch i3wm:
1. Actualize dotfiles  
2. Create a new file /docs/Arch-i3wm.md
3. Update docs
    
## Arch Xfce4:
1. Create a new file /docs/Arch-xfce4.md
2. Update docs
3. write script to automatic instalation

## Mint Xfce4: 
1. Create a new file /docs/Mint-xfce4.md
2. Update docs
3. write script to automatic instalation

## Debian i3wm: 
1. Create a new file /docs/Debian-i3wm.md
2. Update docs
3. Write script to automatic instalation