#!/usr/bin/env bash

export HOMEBREW_NO_ANALYTICS=1

# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add path variables
source ~/.dotfiles/homebrew/_env.sh

# Install recommended dependencies
sudo apt-get install -y build-essential
brew install gcc

# Install my dependencies
~/.dotfiles/homebrew/brew_restore.sh
