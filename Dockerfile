FROM ubuntu:latest

ENV HOME=/home/user/
ENV BROADWAYDPORT=8085
ENV BRADWAYDADDRESS="http://localhost/"
ENV DISPLAYNUMBER=:5
WORKDIR $HOME



RUN groupadd -r user && useradd -r -g user user
RUN apt-get update && apt-get upgrade

RUN apt-get install libgtk-3-bin git libgccjit-11-dev base-devel
RUN cd $HOME
RUN mkdir workdir && cd workdir
RUN git clone https://www.github.com/emacs-mirror/emacs --depth=1 && cd emacs
RUN ./autogen.sh 
RUN ./configure --with-json --with-native-compilation --with-pgtk --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2 --with-mailutils --with-xpm CFLAGS="-O3 -march=native"
RUN make -j$(nproc)
RUN make install
RUN cd .. && rm -rf emacs

USER user

CMD [ "broadwayd" "--port=$BROADWAYDPORT" "--address=$BROADWAYDADDRESS" "$DISPLAYNUMBER" "&&" "GDK_BACKEND=broadway BROADWAY_DISPLAY=:5 emacs"]
