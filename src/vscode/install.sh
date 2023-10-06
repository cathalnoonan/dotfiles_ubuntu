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
    config_folder_path="$HOME/.config/Code/User"
    config_file_path="$config_folder_path/settings.json"
    dotfiles_config_file_path="$HOME/.dotfiles/src/vscode/settings.json"

    # Configure preferences
    mkdir -p $HOME/.config/Code/User
    if [[ -f "$config_file_path" ]]
    then
        echo "Removing existing settings file: $config_file_path"
        rm "$config_file_path"
    fi
    echo "Symlinking config file from: $dotfiles_config_file_path"
    ln -s "$dotfiles_config_file_path" "$config_file_path"
    echo "Symlink created"


    # Add repository
    sudo apt-get install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    # Update package cache and install
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y code # or code-insiders
fi
