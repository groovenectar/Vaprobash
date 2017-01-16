#!/usr/bin/env bash

# Test if NodeJS is installed
node -v > /dev/null 2>&1
NODE_IS_INSTALLED=$?

# Contains all arguments that are passed
NODE_ARG=($@)

# Number of arguments that are given
NUMBER_OF_ARG=${#NODE_ARG[@]}

# Prepare the variables for installing specific Nodejs version and Global Node Packages
if [[ $NUMBER_OF_ARG -gt 2 ]]; then
    # Nodejs version, github url and Global Node Packages are given
    NODEJS_VERSION=${NODE_ARG[0]}
    GITHUB_URL=${NODE_ARG[1]}
    NODE_PACKAGES=${NODE_ARG[@]:2}
elif [[ $NUMBER_OF_ARG -eq 2 ]]; then
    # Only Nodejs version and github url are given
    NODEJS_VERSION=${NODE_ARG[0]}
    GITHUB_URL=${NODE_ARG[1]}
else
    # Default Nodejs version when nothing is given
    NODEJS_VERSION=latest
    GITHUB_URL="https://raw.githubusercontent.com/fideloper/Vaprobash/master"
fi

echo ">>> Start installing NPM and Node"

sudo apt-get install -qq npm node
# :(
sudo ln -s /usr/bin/nodejs /usr/bin/node

if [[ -f "/home/vagrant/.profile" ]]; then
    # Add new NPM Global Packages location to PATH (.profile)
    printf "\n# Add new NPM global packages location to PATH\n%s" 'export PATH=$PATH:~/npm/bin' >> /home/vagrant/.profile

    # Add new NPM root to NODE_PATH (.profile)
    printf "\n# Add the new NPM root to NODE_PATH\n%s" 'export NODE_PATH=$NODE_PATH:~/npm/lib/node_modules' >> /home/vagrant/.profile
fi

# Install (optional) Global Node Packages
if [[ ! -z $NODE_PACKAGES ]]; then
    echo ">>> Start installing Global Node Packages"

    sudo npm install -g ${NODE_PACKAGES[@]}
fi
