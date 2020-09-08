FROM archlinux:latest
ENV TERM xterm
COPY ./pacman.conf /etc/pacman.conf
COPY ./sudoers /etc/sudoers
COPY ./entrypoint.sh /
ENV USER_ID 1000
ENV GROUP_ID 1000
RUN pacman --sync --refresh --sysupgrade --noconfirm sudo && \
curl --silent --show-error --output ./strap.sh https://blackarch.org/strap.sh && \
chmod 755 ./strap.sh && \
./strap.sh && \
rm ./strap.sh && \
find / -type f '(' -name '*.pacnew' -or -name '*.pacsave' ')' -delete 2> /dev/null && \
chmod 440 /etc/sudoers && \
groupadd --gid $GROUP_ID penelope && \
useradd --uid $USER_ID --gid $GROUP_ID --groups wheel --create-home penelope
WORKDIR /root
RUN   pacman --noconfirm --needed -Syu \
    zsh \
    zsh-syntax-highlighting \
    tmux \
    gcc \
    git \
    vim \
    wget \
    tzdata \
    curl \
    make \
    nmap \
    whois \
    python \
    python-pip \
    python3 \
    perl \
    nikto \
    net-tools \
    zsh\
    nano\
    # sqlmap
    sqlmap \
    # dirb
    dirb \
    # dnsenum
    cpanminus \
    # wfuzz
    python-pycurl \
    # knock
    python-dnspython \
    # wpcscan
    libxml2 \
    # theharvester
    python \
    # hydra
    hydra \
    # dnsrecon
    dnsrecon \
    # zsh
    powerline \
    exploitdb \
    gobuster \
    joomlascan \
    wfuzz \
    metasploit \
    beef \
    gdb \
    adb  \
    exploitpack \
    radare2 \
    amass  \
    aquatone \
    metabigor \
    domlink \
    gospider \
    subfinder \
    masscan \
    eyewitness \
    subover


# Installin tools that are not available in blackarch repo
RUN mkdir /$HOME/tools
RUN export PATH=/$HOME/tools:$PATH
# gwen001 github-search
RUN cd /$HOME/tools && \
git clone https://github.com/gwen001/github-search.git
# subdominizer

#calebstewars pwncat
RUN cd /$HOME/tools && \
pip install git+https://github.com/calebstewart/pwncat.git
# GDB GEF plugin
RUN sh -c "$(curl -fsSL http://gef.blah.cat/sh)"
# FavFreak
RUN cd /$HOME/tools && \
 git clone https://github.com/devanshbatham/FavFreak && \
 cd FavFreak && \
 pip3 install virtualenv && \
 virtualenv -p python3 env && \
 source env/bin/activate && \
 python3 -m pip install mmh3 && \
 cat urls.txt | python3 favfreak.py
# Getting Luke Smith's .zshrc and installing oh-my-zsh
RUN cd /$HOME && \
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \

wget https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc && \
mv zshrc .zshrc

# Setting up wordlists
RUN cd /$HOME && \
mkdir wordlists && \
cd wordlists && \
git clone https://github.com/danielmiessler/SecLists.git


CMD ["zsh"]
