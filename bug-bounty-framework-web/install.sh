#!/bin/bash

mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# Wappalyzer
git clone https://github.com/aliasio/wappalyzer
cd wappalyzer || { echo "Failure in cd command"; exit 1; }
yarn install
yarn run link
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# js-beautify

npm -g --force install js-beautify
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }






# massdns

 git clone https://github.com/blechschmidt/massdns.git
 cd massdns || { echo "Failure in cd command"; exit 1; }
 su -c make penelope
 cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


#dnmasscan

git clone https://github.com/rastating/dnmasscan.git
cd dnmasscan || { echo "Failure in cd command"; exit 1; }
chmod +x dnmasscan
cp /home/penelope/tools/dnmasscan/dnmasscan /home/penelope/PATH
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


# masscan

git clone https://github.com/robertdavidgraham/masscan.git
cd masscan || { echo "Failure in cd command"; exit 1; }
su -c make penelope
cp /home/penelope/tools/masscan /home/penelope/PATH
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# yay

git clone https://aur.archlinux.org/yay-git.git
cd yay-git || { echo "Failure in cd command"; exit 1; }
su -c make penelope
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }





#Bug bounty checklists

mkdir checklists
cd checklists || { echo "Failure in cd command"; exit 1; }
wget https://github.com/KathanP19/HowToHunt/raw/master/CheckList/Web_Checklist_by_Chintan_Gurjar.pdf
wget https://raw.githubusercontent.com/KathanP19/HowToHunt/master/CheckList/Web-Application-Pentesting-checklist.md
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }



#Markdown-PP

git clone https://github.com/jreese/markdown-pp.git
cd markdown-pp || { echo "Failure in cd command"; exit 1; }
pip install MarkdownPP
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# m4ll0k tools
git clone https://github.com/m4ll0k/Bug-Bounty-Toolz.git
cd /home/penelope/tools/Bug-Bounty-Toolz || { echo "Failure in cd command"; exit 1; }
for script in ./*.sh; do

  cp $PWD/${script} /home/penelope/PATH

done;
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

## Scripthunter.sh



## grex

wget https://github.com/pemistahl/grex/releases/download/v1.2.0/grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
tar -xvf grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
rm grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
mv grex /home/penelope/PATH
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

## Cleaning 
rm -rf /home/penelope/tools
## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chmod -R 755 /home/penelope/PATH
