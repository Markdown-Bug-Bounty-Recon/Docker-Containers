#!/bin/bash


#ROOT INSTALLATIONS
#create a tools folder in ~/
mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# yay
#git clone https://aur.archlinux.org/yay-git.git
#cd yay-git || { echo "Failure in cd command"; exit 1; }
#makepkg --noconfirm --needed -si 
#cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# arsenal
git clone https://github.com/Orange-Cyberdefense/arsenal.git
cd arsenal || { echo "Failure in cd command"; exit 1; }
python3 -m pip install -r requirements.txt
ln -s /home/penelope/tools/arsenal/run /home/penelope/PATH/
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# ciphey
python3 -m pip install ciphey --upgrade

# Granting permissions
chmod -R 755 /home/penelope/PATH
