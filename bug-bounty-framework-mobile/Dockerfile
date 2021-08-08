FROM cloufish/blackarch-zsh-minimal:latest
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./entrypoint.sh /
WORKDIR /home/penelope


USER root

COPY ./install.sh /home/penelope/
COPY ./setting-up-wordlists.sh /home/penelope/
RUN chmod +x /home/penelope/install.sh && ./install.sh

RUN pacman -Syu --overwrite='*' --noconfirm nuclei jre-openjdk-headless radare2 frida android-sdk android-ndk android-tools android-sdk-build-tools android-apktool drozer python-frida-tools unzip dex2jar cfr objection

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
