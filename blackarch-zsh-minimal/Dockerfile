FROM blackarchlinux/blackarch
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./sudoers /etc/sudoers
RUN chmod 440 /etc/sudoers && groupadd --gid $GROUP_ID penelope && useradd --uid $USER_ID --gid $GROUP_ID --groups wheel --create-home penelope
RUN rm -rf /etc/pacman.d/gnupg
RUN export TERM=xterm && curl --silent --show-error https://blackarch.org/strap.sh | bash
COPY ./entrypoint.sh /
WORKDIR /home/penelope

RUN pacman --needed --noconfirm -S curl wget git python python-pip iputils ruby zsh gcc openvpn gnu-netcat unzip jython tmux nmap xclip yay man-pages man-db sudo lolcat figlet nodejs base-devel yarn neovim npm postgresql ruby-bundler zsh-syntax-highlighting

#Setting up password for penelope
USER root
RUN echo "penelope:penelope" | chpasswd

USER penelope


# Setting up zsh and getting Luke Smith's .zshrc and installing oh-my-zsh

RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && rm ~/.zshrc 
COPY ./.zshrc /home/penelope/.zshrc
RUN echo 'penelope' | chsh -s /usr/bin/zsh
# Copying Luke Smith's shell files
RUN mkdir -p /home/penelope/.config/shell
COPY aliasrc /home/penelope/.config/shell/aliasrc


### ASCII HEADER
RUN wget https://raw.githubusercontent.com/Cloufish/non_blackarch_tools/main/.welcome.sh -O ~/.welcome.sh


# DOING THE SAME FOR ROOT USER
USER root
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && rm ~/.zshrc
COPY ./.zshrc ~/.zshrc
RUN echo 'penelope' | chsh -s /usr/bin/zsh
RUN chsh -s /usr/bin/zsh
# Setting up tmux

USER penelope
RUN cd ~/.config/ && git clone https://github.com/gpakosz/.tmux.git && echo "set -g default-command /usr/sbin/zsh" >>  ~/.config/.tmux/.tmux.conf.local && ln -s -f ~/.config/.tmux/.tmux.conf ~/.tmux.conf && cp ~/.config/.tmux/.tmux.conf.local ~/.tmux.conf.local


RUN wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.config/nvim/init.vim && mkdir -p ~/.config/nvim && mv init.vim ~/.config/nvim && cp ~/.config/nvim/init.vim ~/ && mv init.vim .vimrc

# Setting up man and bat
RUN export MANPAGER="sh -c 'col -bx | bat -l man -p'" 

RUN mkdir /home/penelope/PATH && mkdir -p /home/penelope/.gem/ruby/2.7.0/bin && mkdir -p /home/penelope/.local/bin

USER root
RUN pacman -Syu --noconfirm

COPY ./install.sh /home/penelope/install.sh
RUN chmod +x /home/penelope/install.sh

USER penelope
RUN /home/penelope/install.sh

#From -> https://github.com/ibraheemdev/modern-unix
RUN yay --needed --noconfirm -S lsd tldr curlie jq zoxide

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
