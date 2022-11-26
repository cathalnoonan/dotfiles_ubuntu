#!/usr/bin/env bash

WORKING_DIR=$(pwd)

cd $DOTFILES_ROOT/homebrew
rm -rf ./Brewfile
brew bundle dump --describe
cd $WORKING_DIR
