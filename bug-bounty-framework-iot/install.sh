#!/bin/bash

mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# yay

git clone https://aur.archlinux.org/yay.git &&
cd yay || { echo "Failure in cd command"; exit 1; }
makepkg -si --no-confirm
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }



# Python pwntools
pip install pwn

#My-Tools

#bug bounty framework
git clone https://github.com/Cloufish/Markdown-Bug-Bounty-Recon.git
cd /home/penelope/tools/Markdown-Bug-Bounty-Recon/ || { echo "Failure in cd command"; exit 1; }
bash -c "shopt -s extglob"
bash -c "rm !(*Mobile*)"
cd /home/penelope/tools/Markdown-Bug-Bounty-Recon/Mobile || { echo "Failure in cd command"; exit 1; }

  for script in ./*.sh; do

    cp "$PWD"/"${script}" /home/penelope/PATH

  done;
	cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }



## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chmod -R 755 /home/penelope/PATH
