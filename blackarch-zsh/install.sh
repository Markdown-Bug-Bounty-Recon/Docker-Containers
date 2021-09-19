#!/bin/bash


#ROOT INSTALLATIONS
#create a tools folder in ~/


mkdir /home/penelope/tools
cd /home/penelope/tools || { echo "Failure in cd command"; exit 1; }

#calebstewars pwncat

pip install git+https://github.com/calebstewart/pwncat.git
pip install -U git+https://github.com/calebstewart/paramiko
pip install base64io


## wpscan
echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan || { echo "Failure in cd command"; exit 1; }
gem install bundler && bundle install --without test
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }
echo "done"

# exiftool
cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget  https://raw.githubusercontent.com/exiftool/exiftool/master/exiftool
chmod +x exiftool
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

# polenum

cd /home/penelope/PATH || { echo "Failure in cd command"; exit 1; }
wget https://raw.githubusercontent.com/Wh1t3Fox/polenum/master/polenum.py
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


#LinPeas, WinPeas, Linux Exploit suggester-2
 git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
 mv privilege-escalation-awesome-scripts-suite privesc
 cd privesc || { echo "Failure in cd command"; exit 1; }
 wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl
 cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


# bpython and other modules

pip install bpython requests beautifulsoup4 lxml


#My-Tools
	

	# HTB_automation
	git clone https://github.com/Cloufish/HTB_automation.git
	cd HTB_automation || { echo "Failure in cd command"; exit 1; }
	ln htb_recon.sh /home/penelope/PATH
	ln htb_converter_to_markdown.sh /home/penelope/PATH
	cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }


# To update Offilne GTFO Bins
gtfoblookup update

# Cloning john related toolkit
git clone https://github.com/openwall/john.git
ln /home/penelope/tools/john/run/ssh2john /home/penelope/PATH
# enum4linux
wget https://raw.githubusercontent.com/CiscoCXSecurity/enum4linux/master/enum4linux.pl -O /home/penelope/PATH/enum4linux
touch /etc/samba/smb.conf
cd /home/penelope/tools/ || { echo "Failure in cd command"; exit 1; }

r2pm init
r2pm install r2dec

## GRANTING 755 PERMISSIONS ON ALL FILES IN PATH
chown -R penelope /home/penelope/tools
chmod -R 755 /home/penelope/tools
chown -R penelope /home/penelope/PATH #Takes too much space for Docker container
chmod -R 755 /home/penelope/PATH
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"

