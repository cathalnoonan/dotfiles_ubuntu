#!/usr/bin/env bash

export HOMEBREW_NO_ANALYTICS=1

# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add path variables
source $DOTFILES_ROOT/homebrew/_env.sh

# Install recommended dependencies
sudo apt-get install build-essential
brew install gcc

# Install my dependencies
$DOTFILES_ROOT/homebrew/brew_restore.sh
