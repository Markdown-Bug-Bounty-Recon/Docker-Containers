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
		man-pages \
		sudo \
		nodejs \
		base-devel \
		yarn \
		vim \
		vi \
		npm \
		postgresql \
		ruby-bundler \
		zsh-syntax-highlighting

USER penelope


# Setting up zsh and getting Luke Smith's .zshrc and installing oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
rm ~/.zshrc && \
wget https://raw.githubusercontent.com/Cloufish/voidrice/master/.config/zsh/.zshrc -O ~/.zshrc && \

# Setting up tmux

mkdir -p ~/.config/tmux/ && \
cd ~/.config/tmux/ && \
wget https://raw.githubusercontent.com/Cloufish/dotfiles/main/.config/tmux/.tmux.conf && \
cd ~/

# DOING THE SAME FOR ROOT USER
USER root
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
rm ~/.zshrc && \
wget https://raw.githubusercontent.com/Cloufish/voidrice/master/.config/zsh/.zshrc -O ~/.zshrc

USER penelope
RUN wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.config/nvim/init.vim && \
mkdir ~/.config/ && mkdir ~/.config/nvim && \
mv init.vim ~/.config/nvim && \
cp ~/.config/nvim/init.vim ~/ &&\
mv init.vim .vimrc



export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Setting up man and bat

RUN mkdir /home/penelope/PATH && \

mkdir -p /home/penelope/.gem/ruby/2.7.0/bin && \
mkdir -p /home/penelope/.local/bin

USER root
RUN pacman -Syyu --noconfirm 

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
