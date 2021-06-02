#!/bin/bash

mkdir /home/penelope/tools
cd /home/penelope/tools

# Wappalyzer
git clone https://github.com/aliasio/wappalyzer
cd wappalyzer || { echo "Failure in cd command"; exit 1; }
yarn install
yarn run link
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# js-beautify

npm -g --force install js-beautify
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

# csv2md
npm install -g csv2md

# Setting up wordlists
mkdir /home/penelope/tools/SecLists
cd /home/penelope/tools/SecLists || { echo "Failure in cd command"; exit 1; }
mkdir Javascript-URLs
cd Javascript-URLs || { echo "Failure in cd command"; exit 1; }
wget https://s3.amazonaws.com/assetnote-wordlists/data/automated/httparchive_js_2021_01_28.txt -O js-wordlist.txt
cd ..
mkdir Github-Dorks
cd  Github-Dorks || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/obheda12/GitDorker/master/Dorks/alldorksv3
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
ln /home/penelope/tools/dnmasscan/dnmasscan /home/penelope/PATH
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


# masscan

git clone https://github.com/robertdavidgraham/masscan.git
cd masscan || { echo "Failure in cd command"; exit 1; }
su -c make penelope
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# yay

git clone https://aur.archlinux.org/yay-git.git
cd yay-git || { echo "Failure in cd command"; exit 1; }
su -c make penelope
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


# nuclei-templates

git clone https://github.com/projectdiscovery/nuclei-templates.git
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

  ln $PWD/${script} /home/penelope/PATH

done;
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


#My-Tools

#bug bounty framework
git clone https://github.com/Cloufish/bug_bounty_framework.git
cd /home/penelope/tools/bug_bounty_framework/ || { echo "Failure in cd command"; exit 1; }
ls | grep -v Web | parallel rm -rf
cd /home/penelope/tools/bug_bounty_framework/Web || { echo "Failure in cd command"; exit 1; }

  for script in ./*.sh; do

    ln $PWD/${script} /home/penelope/PATH

  done;
	cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }




cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget https://gist.githubusercontent.com/jhaddix/1fb7ab2409ab579178d2a79959909b33/raw/e9fea4c0f6982546d90d241bc3e19627a7083e5e/Gdorklinks.sh
mv Gdorklinks.sh gdorklinks
chmod +x gdorklinks
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


## grex

wget https://github.com/pemistahl/grex/releases/download/v1.2.0/grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
tar -xvf grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
rm grex-v1.2.0-x86_64-unknown-linux-musl.tar.gz
mv grex /home/penelope/PATH
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

## bbrf
pip install bbrf
mkdir /home/penelope/.bbrf
cat > /home/penelope/.bbrf/config.json << EOF
{
    "username": "bbrf",
    "password": "penelope",
    "couchdb": "https://<your-bbrf-server>/bbrf",
    "slack_token": "<a slack token to receive notifications>",
    "discord_webhook": "<your discord webhook if you want one>",
    "ignore_ssl_errors": false
}
EOF


## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chown -R penelope /home/penelope/tools
chmod -R 755 /home/penelope/tools
chown -R penelope /home/penelope/PATH #Takes too much space for Docker container
chmod -R 755 /home/penelope/PATH
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
