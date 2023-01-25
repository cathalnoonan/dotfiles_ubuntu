#!/usr/bin/env bash

# Only install in interactive environments
#   This is a quick check on variables that should be set to "1" if they are truthy
#   Check if a concatenated string containing "DOTFILES_IS_DOCKER" and "DOTFILES_IS_WSL"
#   is an empty string. This should only happen if neither check is true.
if [ "$DOTFILES_IS_DOCKER$DOTFILES_IS_WSL" != "" ]; then
    echo
    echo "Skipping vscode install for non-interactive environment."
    echo
else
    # Add repository
    sudo apt-get install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    # Update package cache and install
    sudo apt install -y apt-transport-https
    sudo apt update
    sudo apt install -y code # or code-insiders
fi
