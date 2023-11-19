#!/usr/bin/env bash

# Only install in interactive environments
#   This is a quick check on variables that should be set to "1" if they are truthy
#   Check if a concatenated string containing "DOTFILES_IS_DOCKER" and "DOTFILES_IS_WSL"
#   is an empty string. This should only happen if neither check is true.
if [ "$DOTFILES_IS_DOCKER$DOTFILES_IS_WSL" != "" ]; then
    echo
    echo "Skipping flatpak install for non-interactive environment."
    echo
else
    sudo apt-get install -y \
        flatpak \
        gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi
