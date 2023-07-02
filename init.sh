#!/usr/bin/sh

# broadwayd --port $BROADWAYDPORT --address $BROADWAYDADDRESS $DISPLAYNUMBER \
    #     && GDK_BACKEND=broadway BROADWAY_DISPLAY=$DISPLAYNUMBER emacs

echo "$DISPLAY"

broadwayd --port 8085 :5

# GDK_BACKEND=broadway BROADWAY_DISPLAY=:7 emacs

GDK_BACKEND=broadway BROADWAY_DISPLAY=:5 emacs