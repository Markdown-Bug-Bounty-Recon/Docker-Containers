FROM cloufish/blackarch-zsh-minimal:latest
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./entrypoint.sh /
WORKDIR /home/penelope


USER root


RUN pacman -Syu --noconfirm

RUN sed  -i 's/^# Server/Server/' "/etc/pacman.d/blackarch-mirrorlist"

RUN pacman --needed --noconfirm --overwrite='*' 'python-termcolor' -Syu nmap metasploit sqlmap exploitdb gobuster joomlascan wfuzz ffuf openssh gdb android-apktool adb exploitpack gau radare2 smbclient openldap msf-mpc jq msfdb binwalk wordlistctl haiti groff bison ffmpeg


COPY ./install.sh /home/penelope/
COPY ./setting-up-wordlists.sh /home/penelope/
COPY ./exploit_databases_init.sh /home/penelope
RUN chmod +x /home/penelope/install.sh && ./install.sh
RUN chmod +x /home/penelope/setting-up-wordlists.sh && ./setting-up-wordlists.sh

USER penelope
#RUN yay --needed --noconfirm -S stegsnow # fatal: repository 'https://anonscm.debian.org/git/collab-maint/stegsnow.git/' not found

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
