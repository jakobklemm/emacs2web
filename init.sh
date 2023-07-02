#!/usr/bin/sh

export BROADWAYDPORT=8085
export BRADWAYDADDRESS="http://localhost/"
export DISPLAYNUMBER=":5"

echo "$DISPLAY"

broadwayd --port 8085 :7 &
GDK_BACKEND=broadway BROADWAY_DISPLAY=:7 emacs
