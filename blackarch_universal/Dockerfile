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


RUN export PATH=$HOME/tools:$PATH

#calebstewars pwncat
RUN cd $HOME/tools && \
pip install git+https://github.com/calebstewart/pwncat.git
# GDB GEF plugin
RUN sh -c "$(curl -fsSL http://gef.blah.cat/sh)"


 # Running 
# Getting Luke Smith's .zshrc and installing oh-my-zsh
RUN cd $HOME && \
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \

wget https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc && \
mv zshrc .zshrc



# Setting up man and bat 
RUN export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Setting up Lazyrecon tools, probably the most important part
RUN git clone https://github.com/Cloufish/bbht.git && \ 
cd bbht && \ 
chmod +755 install.sh  && \
./install.sh

CMD ["zsh"]
