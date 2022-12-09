#!/usr/bin/env bash

WORKING_DIRECTORY=$(pwd)

cd ~/.dotfiles
git checkout main
git pull
cd $WORKING_DIRECTORY
