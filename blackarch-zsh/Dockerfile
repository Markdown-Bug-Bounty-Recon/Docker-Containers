
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
		nodejs \
		yarn \
		zsh-syntax-highlighting

USER penelope
# GDB GEF plugin
RUN sh -c "$(curl -fsSL http://gef.blah.cat/sh)"


# Setting up zsh and getting Luke Smith's .zshrc and installing oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
wget https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc && \
mv zshrc .zshrc

RUN wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.config/nvim/init.vim && \
mkdir ~/.config/ && mkdir ~/.config/nvim && \
mv init.vim ~/.config/nvim && \
cp ~/.config/nvim/init.vim ~/ &&\
mv init.vim .vimrc
RUN echo "set -g default-shell /bin/zsh" >> tmux.conf && \
mv tmux.conf .tmux.conf && \

# Setting up man and bat

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Setting up environment for Lazyrecon and other tools, probably the most important part

RUN mkdir ~/PATH && \
echo -e ' \n export PATH=/home/penelope/PATH:$PATH' >> .zshrc && \
mkdir -p /home/penelope/.gem/ruby/2.7.0/bin && \
echo -e 'export PATH=/home/penelope/.gem/ruby/2.7.0/bin:$PATH' >> .zshrc && \
mkdir -p /home/penelope/.local/bin && \
echo -e 'export PATH=/home/penelope/.local/bin:$PATH' >> .zshrc && \
echo -e 'source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null' >> .zshrc && \
source .zshrc && \ 
https://github.com/Cloufish/non_blackarch_tools.git

USER root
RUN chmod +x /home/penelope/non_blackarch_tools/install.sh

USER penelope
RUN cd /home/penelope/non_blackarch_tools && \
./install.sh


USER root

RUN pacman --needed --noconfirm -Syu tmux gcc git vim wget tzdata curl iputils make nmap whois openvpn go python python3 perl jq hq yq nikto subbrute peass net-tools nano sqlmap dirb cpanminus python-pycurl python-dnspython libxml2 python hydra dnsrecon powerline bat massdns domlink exploitdb gobuster metabigor joomlascan sublist3r wfuzz metasploit beef corsy gdb adb exploitpack radare2 amass aquatone metabigor domlink gospider subfinder eyewitness subover webanalyze man parallel unzip dex2jar jadx assetfinder httprobe altdns unfurl waybackurls whatweb ffuf nuclei corsy smuggler base-devel jq subscraper hakrawler brutespray eyewitness interlace aquatone chromium npm


CMD ["zsh", "-i"]
