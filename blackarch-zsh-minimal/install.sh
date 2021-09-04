#!/bin/bash


#ROOT INSTALLATIONS
#create a tools folder in ~/
mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# yay
#git clone https://aur.archlinux.org/yay-git.git
#cd yay-git || { echo "Failure in cd command"; exit 1; }
#makepkg --noconfirm --needed -si



git clone https://aur.archlinux.org/yay.git
cd yay || { echo "Failure in cd command"; exit 1; }
makepkg -si --noconfirm
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

rm -rf /home/penelope/tools

# ciphey
python3 -m pip install ciphey pycryptodome telnetlib --upgrade