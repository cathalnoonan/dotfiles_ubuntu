#!/usr/bin/env bash

##
# Get current link from: https://github.com/nvm-sh/nvm
##
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

# Reload configurations
source $DOTFILES_ROOT/nvm/_env.sh

# Install current lts version
nvm install --lts
nvm use --lts
