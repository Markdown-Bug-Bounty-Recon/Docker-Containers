#!/bin/bash

mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# RMS Runtime Mobile Security Framework
git clone https://github.com/m0bilesecurity/RMS-Runtime-Mobile-Security.git
cd RMS-Runtime-Mobile-Security || { echo "Failure in cd command"; exit 1; }
npm install


# Android APK Decompilation for The Lazy

git clone https://github.com/b-mueller/apkx &&
cd apkx &&
sudo ./install.sh &&
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# enjarify

git clone --depth 1 https://github.com/Storyyeller/enjarify;
ln -s /home/penelope/tools/enjarify/enjarify.sh /home/penelope/PATH/enjarify;
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }
# csv2md
npm install -g csv2md

# Python pwntools
pip install pwn

## mdtable (tsv to markdown table)
cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/kusabashira/mdtable/master/mdtable


#Markdown-PP

git clone https://github.com/jreese/markdown-pp.git
cd markdown-pp || { echo "Failure in cd command"; exit 1; }
pip install MarkdownPP
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# r2frida
r2pm init
r2pm -ci r2frida

# apk-mitm - Tool to prepare the apk for Capturing Packets
npm install -g apk-mitm

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
