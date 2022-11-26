#!/usr/bin/env bash

##
# Reference link:
# https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004
##

# Load the current Ubuntu version
source /etc/lsb-release
DIST_VERSION=$DISTRIB_RELEASE

# Prepare installation materials for current distro
wget https://packages.microsoft.com/config/ubuntu/$DIST_VERSION/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install the SDK
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0 && \
  sudo apt-get install -y dotnet-sdk-7.0
