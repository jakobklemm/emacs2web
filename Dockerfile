FROM ghcr.io/jakobklemm/emacs2base:latest

LABEL org.opencontainers.image.licenses=GPLv3

ENV HOME=/home/user/
WORKDIR $HOME

RUN apt-get upgrade

RUN git clone https://github.com/domse007/.emacs.d/ /home/user/.emacs.d

COPY init.sh /home/user/init.sh

USER root

EXPOSE 8085

ENTRYPOINT ["sh", "/home/user/init.sh"]
