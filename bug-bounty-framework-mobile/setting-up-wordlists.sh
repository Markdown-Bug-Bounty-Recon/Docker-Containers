#!/bin/bash

# Setting up wordlists

mkdir -p /home/penelope/wordlists
cd /home/penelope/wordlists || { echo "Failure in cd command"; exit 1; }

# nuclei-templates

git clone https://github.com/optiv/mobile-nuclei-templates.git
cd /home/penelope/wordlists/ || { echo "Failure in cd command"; exit 1; }