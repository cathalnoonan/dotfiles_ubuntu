#!/usr/bin/env bash

bashrc=~/.bashrc
source $bashrc

##
# Install prerequisites
##
sudo apt-get update && sudo apt install -y git

##
# Clone repo
##
git clone https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian.git ~/.dotfiles

##
# Checkout the expected commit
##
if [[ -z "${DOTFILES_COMMIT_SHA}" ]]; then
    WORKING_DIRECTORY=`pwd`
    cd ~/.dotfiles
    git checkout $DOTFILES_COMMIT_SHA
    cd $WORKING_DIRECTORY
fi

##
# Add to bashrc
##
echo "" >> $bashrc
echo "# dotfiles" >> $bashrc
echo "if [ -f ~/.dotfiles/_env.sh ]; then" >> $bashrc
echo "  source ~/.dotfiles/_env.sh" >> $bashrc
echo "fi" >> $bashrc
echo "" >> $bashrc

##
# Reload configuration
##
source $bashrc

##
# Install
##
~/.dotfiles/_install.sh
