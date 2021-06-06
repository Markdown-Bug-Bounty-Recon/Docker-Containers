#!/bin/bash

# Setting up wordlists

mkdir -p /home/penelope/wordlists/SecLists
cd /home/penelope/wordlists/SecLists || { echo "Failure in cd command"; exit 1; }
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
wget https://raw.githubusercontent.com/robre/scripthunter/master/wordlists/jsdirs-common.txt
wget https://raw.githubusercontent.com/robre/scripthunter/master/wordlists/scripthunter-wordlist.txt
cd ..
mkdir Github-Dorks
cd  Github-Dorks || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/obheda12/GitDorker/master/Dorks/alldorksv3
cd /home/penelope/wordlists/ || { echo "Failure in cd command"; exit 1; }


# nuclei-templates

git clone https://github.com/projectdiscovery/nuclei-templates.git
cd /home/penelope/wordlists/ || { echo "Failure in cd command"; exit 1; }