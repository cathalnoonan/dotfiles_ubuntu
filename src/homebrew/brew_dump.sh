#!/usr/bin/env bash

WORKING_DIR=$(pwd)

cd ~/.dotfiles/src/homebrew
rm -rf ./Brewfile
brew bundle dump --describe
cd $WORKING_DIR
