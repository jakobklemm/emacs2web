#!/usr/bin/sh

export BROADWAYDPORT=8085
export BRADWAYDADDRESS="http://localhost/"
export DISPLAYNUMBER=":5"

echo "Emacs is running on " $DISPLAYNUMBER
echo "Emacs is accessible at " $BRADWAYDADDRESS$BROADWAYDPORT "/"

# broadwayd --port $BROADWAYDPORT --address $BROADWAYDADDRESS $DISPLAYNUMBER \
    #     && GDK_BACKEND=broadway BROADWAY_DISPLAY=$DISPLAYNUMBER emacs

broadwayd $DISPLAYNUMBER \
    && GDK_BACKEND=broadway BROADWAY_DISPLAY=:5 emacs
