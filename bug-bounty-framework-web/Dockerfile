FROM cloufish/blackarch-zsh-minimal:latest
ENV USER_ID 1000
ENV GROUP_ID 1000
COPY ./entrypoint.sh /
WORKDIR /home/penelope


USER root

COPY ./install.sh /home/penelope/
COPY ./setting-up-wordlists.sh /home/penelope/
RUN chmod +x /home/penelope/install.sh && ./install.sh
RUN chmod +x /home/penelope/setting-up-wordlists.sh && ./setting-up-wordlists.sh

RUN pacman -Syu --overwrite='*' --noconfirm nuclei httprobe ffuf xcat gau parallel amass jq gitdorker webanalyze tplmap hakrawler httpx unfurl ngrok whatwaf favfreak

USER penelope
# bbrf
RUN mkdir -p /home/penelope/.bbrf
COPY ./config.json /home/penelope/.bbrf/

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["zsh", "-ic", "tmux"]
