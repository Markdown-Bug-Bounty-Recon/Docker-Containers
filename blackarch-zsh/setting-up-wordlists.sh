#!/bin/bash

# Setting up wordlists
mkdir /home/penelope/SecLists
cd /home/penelope/SecLists || { echo "Failure in cd command"; exit 1; }
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

cd ..

wget https://gitlab.com/kalilinux/packages/wordlists/-/raw/kali/master/rockyou.txt.gz
gunzip rockyou.txt.gz

mkdir Reverse_Shells
cd Reverse_Shells  || { echo "Failure in cd command"; exit 1; }
wget http://pentestmonkey.net/tools/php-reverse-shell/php-reverse-shell-1.0.tar.gz &&
gunzip php-reverse-shell-1.0.tar.gz &&
tar -xvf php-reverse-shell-1.0.tar &&
rm php-reverse-shell-1.0.tar &&
mv php-reverse-shell-1.0/php-reverse-shell.php . &&
rm -rf php-reverse-shell-1.0 &&
cd .. 


mkdir Usernames
cd Usernames  || { echo "Failure in cd command"; exit 1; }
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


searchsploit database
searchsploit -u #TOO MUCH STORAGE IT TAKES, you can disable it if you don't use searchsploit and you're just googling exploits yourself
msfdb-blackarch init