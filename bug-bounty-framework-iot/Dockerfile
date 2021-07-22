FROM cloufish/blackarch-zsh-minimal
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./entrypoint.sh /
WORKDIR /home/penelope


USER root

COPY ./install.sh /home/penelope/
COPY ./setting-up-wordlists.sh /home/penelope/
RUN chmod +x /home/penelope/install.sh && ./install.sh

RUN pacman -Syu --overwrite='*' --noconfirm fat binwalk

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
