 
FROM dadevel/blackarch

RUN pacman --needed --noconfirm -Syu curl \
		wget \
		git \
		go \
		python \
		python-pip \
		ruby


# GDB GEF plugin
RUN sh -c "$(curl -fsSL http://gef.blah.cat/sh)"


# Setting up zsh and getting Luke Smith's .zshrc and installing oh-my-zsh
RUN pacman -Syu --needed --noconfirm zsh zsh-syntax-highlighting && \
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
wget https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc && \
mv zshrc .zshrc

# Setting up man and bat 
RUN export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Setting up Lazyrecon and other tools, probably the most important part
RUN git clone https://github.com/Cloufish/bbht.git

CMD ["zsh", "-i"]