#!/usr/bin/sh

# broadwayd --port $BROADWAYDPORT --address $BROADWAYDADDRESS $DISPLAYNUMBER \
    #     && GDK_BACKEND=broadway BROADWAY_DISPLAY=$DISPLAYNUMBER emacs

echo "$DISPLAY"

gtk4-broadwayd :5

# broadwayd --port 8085 :7 &
# GDK_BACKEND=broadway BROADWAY_DISPLAY=:7 emacs

GDK_BACKEND=broadway BROADWAY_DISPLAY=:5 emacs