#!/usr/bin/env bash

echo ">>> Setting up Modman"

bash < <(wget -q --no-check-certificate -O - https://raw.github.com/groovenectar/modman/master/modman-installer)

source ~/.profile
