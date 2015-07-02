#!/usr/bin/env bash

echo ">>> Installing Modman"

bash < <(wget -q --no-check-certificate -O - https://raw.github.com/groovenectar/modman/master/modman-installer)

# Should not be necessary for provisioning
# . ~/.profile
