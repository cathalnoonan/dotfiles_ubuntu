#!/usr/bin/env bash

##
# Reference links:
# - https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004
# - https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian#debian-11-
##

# Avoid dotnet installing from a default ppa
if [[ -f /etc/apt/preferences.d/microsoft-dotnet.pref ]]; then
    sudo rm /etc/apt/preferences.d/microsoft-dotnet.pref
fi
sudo ln -s ~/.dotfiles/src/dotnet/microsoft-dotnet.pref /etc/apt/preferences.d/

# Load the current Distro version
source /etc/os-release
DIST_NAME=$ID
DIST_VERSION=$VERSION_ID

# Prepare installation materials for current distro
wget https://packages.microsoft.com/config/$DIST_NAME/$DIST_VERSION/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install the SDK
sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-6.0
