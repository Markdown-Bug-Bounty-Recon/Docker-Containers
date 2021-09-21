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

# Python pwntools
pip install pwn

# Granting permissions
chmod -R 755 /home/penelope/PATH

# Cleaning unneeded gcc binaries
set -ex && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/cc1obj && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/lto1 && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/lto-wrapper && \
    rm -f /usr/bin/x86_64-alpine-linux-musl-gcj