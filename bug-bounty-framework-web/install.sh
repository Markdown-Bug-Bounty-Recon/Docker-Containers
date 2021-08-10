#!/bin/bash

mkdir /home/penelope/.tools-source-files
tools_directory="/home/penelope/.tools-source-files"
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

# Wappalyzer
git clone https://github.com/aliasio/wappalyzer
cd wappalyzer || { echo "Failure in cd command"; exit 1; }
yarn install
yarn run link
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

# js-beautify

npm -g --force install js-beautify
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

# csv2md
npm install -g csv2md

## mdtable (tsv to markdown table)
cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/kusabashira/mdtable/master/mdtable

cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

# massdns

 git clone https://github.com/blechschmidt/massdns.git
 cd massdns || { echo "Failure in cd command"; exit 1; }
 su -c make penelope
 ln "${tools_directory}"/massdns/bin/massdns /home/penelope/PATH/massdns
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

# puredns
export GO111MODULE=on && go get github.com/d3mondev/puredns/v2

# dnsgen
sudo -H pip3 install dnsgen

#dnmasscan

git clone https://github.com/rastating/dnmasscan.git
cd dnmasscan || { echo "Failure in cd command"; exit 1; }
chmod +x dnmasscan
ln "${tools_directory}"/dnmasscan/dnmasscan /home/penelope/PATH/dnmasscan
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }


# masscan

git clone https://github.com/robertdavidgraham/masscan.git
cd masscan || { echo "Failure in cd command"; exit 1; }
su -c make penelope
ln "${tools_directory}"/masscan /home/penelope/PATH
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }





#Markdown-PP

git clone https://github.com/jreese/markdown-pp.git
cd markdown-pp || { echo "Failure in cd command"; exit 1; }
pip install MarkdownPP
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

# m4ll0k tools
git clone https://github.com/m4ll0k/Bug-Bounty-Toolz.git
cd "${tools_directory}"/Bug-Bounty-Toolz || { echo "Failure in cd command"; exit 1; }
for script in ./*.sh; do

  cp "$PWD/${script}" /home/penelope/PATH


done;
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }


#My-Tools

#bug bounty framework
git clone https://github.com/Cloufish/Markdown-Bug-Bounty-Recon.git
cd "${tools_directory}"/Markdown-Bug-Bounty-Recon/ || { echo "Failure in cd command"; exit 1; }
bash -c "shopt -s extglob"
bash -c "rm !(*Web*)"
cd "${tools_directory}"/Markdown-Bug-Bounty-Recon/Web || { echo "Failure in cd command"; exit 1; }

  for script in ./*.sh; do

    ln "$PWD"/"${script}" /home/penelope/PATH

  done;
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }




cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget https://gist.githubusercontent.com/jhaddix/1fb7ab2409ab579178d2a79959909b33/raw/e9fea4c0f6982546d90d241bc3e19627a7083e5e/Gdorklinks.sh
mv Gdorklinks.sh gdorklinks
chmod +x gdorklinks
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

## Scripthunter.sh
git clone https://github.com/robre/scripthunter.git
cd scripthunter || { echo "Failure in cd command"; exit 1; }
chmod +x scripthunter.sh
ln "${tools_directory}"/scripthunter/scripthunter.sh /home/penelope/PATH/scripthunter
cd ..
## grex

wget https://github.com/pemistahl/grex/releases/download/v1.2.0/grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
tar -xvf grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
rm grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
mv grex /home/penelope/PATH
cd "${tools_directory}" || { echo "Failure in cd command"; exit 1; }

## bbrf
pip install bbrf
mkdir /root/.bbrf
ln -s /home/penelope/.bbrf/config.json /root/.bbrf/config.json

## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chmod -R 755 /home/penelope/PATH
