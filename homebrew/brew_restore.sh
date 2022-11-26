#!/usr/bin/env bash

WORKING_DIR=$(pwd)

cd $DOTFILES_ROOT/homebrew
brew bundle install
cd $WORKING_DIR
