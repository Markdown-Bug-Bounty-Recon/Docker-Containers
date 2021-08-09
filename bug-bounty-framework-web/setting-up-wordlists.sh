#!/bin/bash

# Setting up wordlists

mkdir -p /home/penelope/wordlists/
cd /home/penelope/wordlists/ || { echo "Failure in cd command"; exit 1; }
mkdir Directory-Bruting
cd Directory-Bruting || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-small.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-medium.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-big.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-small-directories.txt
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
cd ..
mkdir Subdomain-Wordlists
cd Subdomain-Wordlists || { echo "Failure in cd command"; exit 1; }
wget https://wordlists-cdn.assetnote.io/data/manual/2m-subdomains.txt
cd ..
# nuclei-templates
git clone https://github.com/projectdiscovery/nuclei-templates.git
cd ..
mkdir Resolvers
cd Resolvers || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt
cd ..