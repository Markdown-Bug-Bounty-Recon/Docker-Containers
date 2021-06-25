FROM cloufish/blackarch-zsh-minimal
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./entrypoint.sh /
WORKDIR /home/penelope


USER root

COPY ./install.sh /home/penelope/
COPY ./setting-up-wordlists.sh /home/penelope/
COPY ./exploit_databases_init.sh /home/penelope
RUN chmod +x /home/penelope/install.sh && ./install.sh

RUN pacman -Syu --noconfirm

RUN sed  -i 's/^# Server/Server/' "/etc/pacman.d/blackarch-mirrorlist"

RUN pacman --needed --noconfirm --overwrite='*' -Syu tmux gcc git vim wget tzdata curl iputils make nmap whois openvpn go python python3 perl jq hq yq nikto subbrute net-tools nano sqlmap cpanminus python-pycurl python-dnspython libxml2 python hydra powerline bat exploitdb beef

RUN pacman --needed --noconfirm --overwrite='*' -Syu gobuster metabigor joomlascan sublist3r wfuzz beef corsy gdb adb exploitpack radare2 gitdorker gau linkfinder secretfinder

RUN pacman --needed --noconfirm --overwrite='*, usr/lib/python3.8/site-packages/termcolor-1.1.0-py3.8.egg-info/*' -Syu amass aquatone metabigor gospider subfinder subover webanalyze man parallel unzip dex2jar jadx  assetfinder

RUN pacman --needed --noconfirm --overwrite='*' -Syu httpx massdns unfurl openssh waybackurls whatweb smbclient openldap metasploit msf-mpc gnu-netcat samba

RUN pacman --needed --noconfirm --overwrite='*' -Syu  ffuf nuclei corsy smuggler jq subscraper hakrawler brutespray interlace chromium msfdb jdk8-openjdk binwalk smbclient wordlistctl haiti



ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
