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
source ~/.dotfiles/src/release_info.sh

# Prepare installation materials for current distro
wget https://packages.microsoft.com/config/$DIST_NAME/$DIST_VERSION/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install the SDK
sudo apt-get update
sudo apt-get install -y \
    dotnet-sdk-6.0 \
    dotnet-sdk-7.0 \
    dotnet-sdk-8.0


# Fix the following error message:
#   The configured user limit (128) on the number of inotify instances has been reached, or the per-process limit on the number of open file descriptors has been reached.
echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
