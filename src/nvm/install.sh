#!/usr/bin/env bash

##
# Find and install latest version of nvm.
##
NVM_LATEST_VERSION=$(curl -s "https://api.github.com/repos/nvm-sh/nvm/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_LATEST_VERSION/install.sh | bash

# Reload configurations
source ~/.dotfiles/src/nvm/env.sh

# Install current lts version
nvm install --lts
nvm use --lts
