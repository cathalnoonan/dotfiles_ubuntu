#!/usr/bin/env bash

DOTFILES_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install pre-requisites
sudo apt-get update
sudo apt install -y \
    curl \
    wget

# Run all "_install.sh" files in nested folders
for install_file in $DOTFILES_ROOT/*/_install.sh
do
    $install_file
done
