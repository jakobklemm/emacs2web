#!/usr/bin/sh

export BROADWAYDPORT=8085
export BRADWAYDADDRESS="http://localhost/"
export DISPLAYNUMBER=":5"

# broadwayd --port $BROADWAYDPORT --address $BROADWAYDADDRESS $DISPLAYNUMBER \
    #     && GDK_BACKEND=broadway BROADWAY_DISPLAY=$DISPLAYNUMBER emacs

echo "TEST TEST"
echo "$DISPLAY"

broadwayd --port 8085 :7 &
GDK_BACKEND=broadway BROADWAY_DISPLAY=:7 emacs
