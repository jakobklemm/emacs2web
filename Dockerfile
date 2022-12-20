FROM ubuntu:latest

LABEL author="Dominik Keller" maintainer=""
LABEL org.opencontainers.image.licenses=GPLv3

ENV HOME=/home/user/
ENV BROADWAYDPORT=8085
ENV BRADWAYDADDRESS="http://localhost/"
ENV DISPLAYNUMBER=":5"
WORKDIR $HOME



RUN groupadd -r user && useradd -r -g user user
RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install libgtk-3-bin git libgccjit-11-dev libjansson-dev build-essential autoconf texinfo libsqlite3-dev libgtk-3-dev libgnutls28-dev libncurses-dev
RUN git clone https://www.github.com/emacs-mirror/emacs --depth=1
WORKDIR $HOME/emacs
RUN ./autogen.sh 
RUN ./configure --with-json --with-native-compilation --with-pgtk --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2 --with-mailutils --with-xpm CFLAGS="-O3 -march=native"
RUN make -j$(nproc)
RUN make install
WORKDIR $HOME
RUN rm -rf emacs

USER user

COPY ./init.sh $HOME/init.sh

EXPOSE $BROADWAYDPORT

CMD [ "sh", "init.sh" ]
