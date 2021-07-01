FROM cloufish/blackarch-zsh-minimal
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./entrypoint.sh /
WORKDIR /home/penelope


USER root

COPY ./install.sh /home/penelope/
COPY ./setting-up-wordlists.sh /home/penelope/
COPY ./exploit_databases_init.sh /home/penelope
RUN chmod +x /home/penelope/install.sh && ./install.sh

RUN pacman -Syu --noconfirm

RUN sed  -i 's/^# Server/Server/' "/etc/pacman.d/blackarch-mirrorlist"

RUN pacman --needed --noconfirm --verwrite='*' -S python-termcolor
RUN pacman --needed --noconfirm --overwrite='*' -Syu nmap metasploit sqlmap exploitdb gobuster joomlascan wfuzz ffuf gdb adb exploitpack gau radare2 smbclient openldap msf-mpc jq msfdb binwalk wordlistctl haiti


ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
