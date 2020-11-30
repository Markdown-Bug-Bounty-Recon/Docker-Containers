
FROM dadevel/blackarch


RUN pacman --needed --noconfirm -Syu curl \
		wget \
		git \
		go \
		python \
		python-pip \
		iputils \
		ruby \
		zsh \
		gcc \
		openvpn \
		tmux \
		sudo \
		nodejs \
		base-devel \
		yarn \
		vim \
		vi \
		npm \
		zsh-syntax-highlighting

USER penelope
# GDB GEF plugin
RUN sh -c "$(curl -fsSL http://gef.blah.cat/sh)"


# Setting up zsh and getting Luke Smith's .zshrc and installing oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
rm /home/penelope/.zshrc && \
wget https://raw.githubusercontent.com/Cloufish/voidrice/master/.config/zsh/.zshrc

RUN wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.config/nvim/init.vim && \
mkdir ~/.config/ && mkdir ~/.config/nvim && \
mv init.vim ~/.config/nvim && \
cp ~/.config/nvim/init.vim ~/ &&\
mv init.vim .vimrc
RUN echo "set -g default-shell /bin/zsh" >> tmux.conf && \
mv tmux.conf .tmux.conf && \

# Setting up man and bat

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Setting up environment for non-blackarch-tools and other tools, probably the most important part

RUN mkdir /home/penelope/PATH 
USER root

RUN echo -e "\n export PATH=/root/.gem/ruby/2.7.0/bin:$PATH" >> /root/.bashrc && \
echo -e "\n export PATH=/home/penelope/.gem/ruby/2.7.0/bin:$PATH" >> /home/penelope/.bashrc && \
source /root/.bashrc
USER penelope
RUN mkdir -p /home/penelope/.gem/ruby/2.7.0/bin && \
mkdir -p /home/penelope/.local/bin && \
git clone https://github.com/Cloufish/non_blackarch_tools.git

USER root
RUN chmod +x /home/penelope/non_blackarch_tools/install.sh

#USER penelope
RUN cd /home/penelope/non_blackarch_tools && \
./install.sh


USER root
RUN sed  -i 's/^# Server/Server/' /etc/pacman.d/blackarch-mirrorlist && \
pacman -Syu --noconfirm 

RUN pacman --needed --noconfirm --overwrite='*' -Syu tmux gcc git vim wget tzdata curl iputils make nmap whois openvpn go python python3 perl jq hq yq nikto subbrute peass net-tools nano sqlmap dirb cpanminus python-pycurl python-dnspython libxml2 python hydra dnsrecon powerline bat massdns domlink exploitdb 

RUN pacman --needed --noconfirm --overwrite='*' -Syu gobuster metabigor joomlascan sublist3r wfuzz metasploit beef corsy gdb adb exploitpack radare2

RUN pacman --needed --noconfirm --overwrite='*, usr/lib/python3.8/site-packages/termcolor-1.1.0-py3.8.egg-info/*' -Syu amass aquatone metabigor domlink gospider subfinder eyewitness subover webanalyze man parallel unzip dex2jar jadx  assetfinder 

RUN pacman --needed --noconfirm --overwrite='*' -Syu httprobe unfurl waybackurls whatweb

RUN pacman --needed --noconfirm --overwrite='*' -Syu  ffuf nuclei corsy smuggler jq subscraper hakrawler brutespray eyewitness interlace chromium


CMD ["zsh", "-i"]
