#!/usr/bin/env bash

# Install pre-requisites
sudo apt-get update
sudo apt install -y \
    curl \
    wget

# Run all "_install.sh" files in nested folders
for install_file in ~/.dotfiles/*/_install.sh
do
    $install_file
done
