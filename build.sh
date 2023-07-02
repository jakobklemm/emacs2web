#!/bin/bash

apt-get update 

DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

apt-get -y install libgtk-3-bin git libgccjit-11-dev libjansson-dev build-essential autoconf texinfo libsqlite3-dev libgtk-3-dev libgnutls28-dev libncurses-dev apt-utils libtree-sitter-dev libxml2 texlive-full dvipng ripgrep 

apt-get -y install xorg libgtk-3-dev libx11

git clone https://www.github.com/emacs-mirror/emacs emacs/ --depth=1
cd emacs/
./autogen.sh 
./configure --with-json --with-native-compilation --with-pgtk --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2 --with-mailutils --with-xpm CFLAGS="-O3 -march=native"
make -j$(nproc)
