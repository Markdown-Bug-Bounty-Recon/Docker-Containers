#!/bin/bash

mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# yay

git clone https://aur.archlinux.org/yay.git &&
cd yay || { echo "Failure in cd command"; exit 1; }
makepkg -si --no-confirm
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


# android-sdk and ndk
yay -S --no-confirm android-sdk android-ndk

# Android APK Decompilation for The Lazy

git clone https://github.com/b-mueller/apkx &&
cd apkx &&
sudo ./install.sh &&
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# csv2md
npm install -g csv2md

## mdtable (tsv to markdown table)
cd /home/penelope/PATH
wget https://raw.githubusercontent.com/kusabashira/mdtable/master/mdtable


#Markdown-PP

git clone https://github.com/jreese/markdown-pp.git
cd markdown-pp || { echo "Failure in cd command"; exit 1; }
pip install MarkdownPP
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


#My-Tools

#bug bounty framework
git clone https://github.com/Cloufish/Markdown-Bug-Bounty-Recon.git
cd /home/penelope/tools/Markdown-Bug-Bounty-Recon/ || { echo "Failure in cd command"; exit 1; }
bash -c "shopt -s extglob"
bash -c "rm !(*Web*)"
cd /home/penelope/tools/Markdown-Bug-Bounty-Recon/Web || { echo "Failure in cd command"; exit 1; }

  for script in ./*.sh; do

    cp "$PWD"/"${script}" /home/penelope/PATH

  done;
	cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }




cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget https://gist.githubusercontent.com/jhaddix/1fb7ab2409ab579178d2a79959909b33/raw/e9fea4c0f6982546d90d241bc3e19627a7083e5e/Gdorklinks.sh
mv Gdorklinks.sh gdorklinks
chmod +x gdorklinks
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


## Cleaning
rm -rf /home/penelope/tools
rm ~/install.sh

## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chmod -R 755 /home/penelope/PATH
