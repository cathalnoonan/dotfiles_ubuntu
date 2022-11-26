#!/usr/bin/env bash

##
# Sources: 
# - https://www.paulsblog.dev/how-to-install-docker-without-docker-desktop-on-windows/
# - https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
##

# 1. Required dependencies 
sudo apt-get update 
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# 2. GPG key 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 

# 3. Use stable repository for Docker 
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm ./get-docker.sh

# 4. Add user to docker group 
sudo usermod -aG docker $USER 
