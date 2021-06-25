FROM cloufish/blackarch-zsh-minimal
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./entrypoint.sh /
WORKDIR /home/penelope


USER root

COPY ./install.sh /home/penelope/
COPY ./setting-up-wordlists.sh /home/penelope/
RUN chmod +x /home/penelope/install.sh && ./install.sh

RUN pacman -Syu --noconfirm nuclei jre-openjdk-headless radare2 frida android-sdk android-ndk android-apktool drozer idb mara-framework python-frida-tools sign smalisca unzip dex2jar cfr objection

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
