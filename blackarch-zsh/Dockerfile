FROM archlinux:latest
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./pacman.conf /etc/pacman.conf
RUN pacman --sync --refresh --sysupgrade --noconfirm core/filesystem core/sudo && \
find / -type f '(' -name '*.pacnew' -or -name '*.pacsave' ')' -delete 2> /dev/null
COPY ./sudoers /etc/sudoers
RUN chmod 440 /etc/sudoers && \
groupadd --gid $GROUP_ID penelope && \
useradd --uid $USER_ID --gid $GROUP_ID --groups wheel --create-home penelope
RUN export TERM=xterm && curl --silent --show-error https://blackarch.org/strap.sh | bash
COPY ./entrypoint.sh /
WORKDIR /home/penelope


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
		man-db \
		sudo \
		man-pages \
		nodejs \
		base-devel \
		yarn \
		vim \
		vi \
		npm \
		postgresql \
		ruby-bundler \
		zsh-syntax-highlighting

#Setting up password for penelope
USER root
RUN echo "penelope:penelope" | chpasswd


USER penelope


# Setting up zsh and getting Luke Smith's .zshrc and installing oh-my-zsh

RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
rm ~/.zshrc && \
wget https://raw.githubusercontent.com/Cloufish/voidrice/master/.config/zsh/.zshrc -O ~/.zshrc && \
echo 'penelope' > chsh -s /usr/bin/zsh
### ASCII HEADER

RUN wget https://raw.githubusercontent.com/Cloufish/non_blackarch_tools/main/.welcome.sh -O ~/.welcome.sh 

# DOING THE SAME FOR ROOT USER
USER root
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
rm ~/.zshrc && \
wget https://raw.githubusercontent.com/Cloufish/voidrice/master/.config/zsh/.zshrc -O ~/.zshrc && \
chsh -s /usr/bin/zsh

# Setting up tmux

USER penelope
RUN mkdir ~/.config/ && \
cd ~/.config/ && \
git clone https://github.com/gpakosz/.tmux.git && \
echo "set -g default-command /usr/sbin/zsh" >>  ~/.config/.tmux/.tmux.conf.local && \
ln -s -f ~/.config/.tmux/.tmux.conf ~/.tmux.conf && \
cp ~/.config/.tmux/.tmux.conf.local ~/.tmux.conf.local

RUN wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.config/nvim/init.vim && \
mkdir ~/.config/nvim && \
mv init.vim ~/.config/nvim && \
cp ~/.config/nvim/init.vim ~/ &&\
mv init.vim .vimrc && \

# Setting up man and bat

export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Setting up environment for non-blackarch-tools and other tools, probably the most important part

RUN mkdir /home/penelope/PATH && \

mkdir -p /home/penelope/.gem/ruby/2.7.0/bin && \
mkdir -p /home/penelope/.local/bin && \
git clone https://github.com/Cloufish/non_blackarch_tools.git && \
cp /home/penelope/non_blackarch_tools/exploit_databases_init.sh /home/penelope

USER root
RUN chmod +x /home/penelope/non_blackarch_tools/install.sh



RUN pacman -Syyu --noconfirm

RUN sed  -i 's/^# Server/Server/' "/etc/pacman.d/blackarch-mirrorlist"

RUN pacman --needed --noconfirm --overwrite='*' -Syu tmux gcc git vim wget tzdata curl iputils make nmap whois openvpn go python python3 perl jq hq yq nikto subbrute net-tools nano sqlmap cpanminus python-pycurl python-dnspython libxml2 python hydra powerline bat exploitdb beef

RUN pacman --needed --noconfirm --overwrite='*' -Syu gobuster metabigor joomlascan sublist3r wfuzz beef corsy gdb adb exploitpack radare2 gitdorker gau linkfinder secretfinder

RUN pacman --needed --noconfirm --overwrite='*, usr/lib/python3.8/site-packages/termcolor-1.1.0-py3.8.egg-info/*' -Syu amass aquatone metabigor gospider subfinder subover webanalyze man parallel unzip dex2jar jadx  assetfinder

RUN pacman --needed --noconfirm --overwrite='*' -Syu httprobe unfurl openssh waybackurls whatweb smbclient openldap metasploit msf-mpc gnu-netcat samba

RUN pacman --needed --noconfirm --overwrite='*' -Syu  ffuf nuclei corsy smuggler jq subscraper hakrawler brutespray interlace chromium msfdb jdk8-openjdk binwalk smbclient wordlistctl haiti


#RUN sed  -i 's/^Server/# Server/' "/etc/pacman.d/blackarch-mirrorlist"

RUN cd /home/penelope/non_blackarch_tools && \
./install.sh && \
rm -rf /home/penelope/non_blackarch_tools

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
