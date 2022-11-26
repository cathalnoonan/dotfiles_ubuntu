#!/usr/bin/env bash

WORKING_DIR=$(pwd)

cd ~/.dotfiles/homebrew
brew bundle install
cd $WORKING_DIR
