#!/usr/bin/env bash

echo ">>> Installing Modman"

SRC="https://raw.githubusercontent.com/colinmollenhour/modman/master/modman"
DEST="/usr/bin/modman"

# test if curl/wget is installed
if hash curl 2>&- ; then
    CMD="sudo curl -s -L $SRC -o $DEST"
elif hash wget 2>&- ; then
    CMD="sudo wget -q --no-check-certificate -O $DEST $SRC"
else
   echo "You need to have curl or wget installed."
   exit 1
fi

$CMD

sudo chmod +x $DEST

echo "Done. Modman installed in /usr/bin/modman"
