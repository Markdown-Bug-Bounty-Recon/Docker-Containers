
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
		openvpn \
		tmux \
		zsh-syntax-highlighting

USER penelope
# GDB GEF plugin
RUN sh -c "$(curl -fsSL http://gef.blah.cat/sh)"


# Setting up zsh and getting Luke Smith's .zshrc and installing oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
wget https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc && \
mv zshrc .zshrc && \

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
echo source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null && \
echo 'export PATH=/home/penelope/PATH:$PATH' >> .zshrc && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && \
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc && \
git clone https://github.com/Cloufish/bbht.git
USER root
RUN pacman --needed --noconfirm -Syu tmux gcc git vim wget tzdata curl iputils make nmap whois openvpn go python python3 perl jq hq yq nikto subbrute peass net-tools nano sqlmap dirb cpanminus python-pycurl python-dnspython libxml2 python hydra dnsrecon powerline bat massdns domlink exploitdb gobuster metabigor joomlascan sublist3r wfuzz metasploit beef corsy gdb adb exploitpack radare2 amass aquatone metabigor domlink gospider subfinder masscan eyewitness subover webanalyze

CMD ["zsh", "-i"]
