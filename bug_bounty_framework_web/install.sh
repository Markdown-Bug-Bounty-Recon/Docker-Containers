#!/bin/bash

# Wappalyzer
git clone https://github.com/aliasio/wappalyzer
cd wappalyzer || { echo "Failure in cd command"; exit 1; }
yarn install
yarn run link
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# js-beautify

npm -g --force install js-beautify
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }



# Setting up wordlists
mkdir /home/penelope/tools/SecLists
cd /home/penelope/tools/SecLists || { echo "Failure in cd command"; exit 1; }
mkdir Directory-Bruting
cd Directory-Bruting || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-small.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-medium.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-big.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-small-directories.txt
cd ..
mkdir Passwords

cd Passwords  || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords-1000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords-10000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords-100000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords-1000000.txt
wget https://gitlab.com/kalilinux/packages/wordlists/-/raw/kali/master/rockyou.txt.gz
gunzip rockyou.txt.gz
cd ..
mkdir Usernames
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Usernames/xato-net-10-million-usernames-dup.txt -O ./xato-net-10-million-usernames-medium.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Usernames/xato-net-10-million-usernames.txt
cd ..
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

  ln $PWD/${script} /home/penelope/PATH

done;
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


#My-Tools
	#bug bounty framework
	git clone https://github.com/Cloufish/bug_bounty_framework.git
	cd /home/penelope/tools/bug_bounty_framework || { echo "Failure in cd command"; exit 1; }

  for script in ./*.sh; do

    ln $PWD/${script} /home/penelope/PATH

  done;
	cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

	# HTB_automation
	git clone https://github.com/Cloufish/HTB_automation.git
	cd HTB_automation || { echo "Failure in cd command"; exit 1; }
	ln htb_recon.sh /home/penelope/PATH
	ln htb_converter_to_markdown.sh /home/penelope/PATH
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

## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chown -R penelope /home/penelope/tools
chmod -R 755 /home/penelope/tools
chown -R penelope /home/penelope/PATH #Takes too much space for Docker container
chmod -R 755 /home/penelope/PATH
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
