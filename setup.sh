#!/usr/bin/env bash

##
# Install prerequisites
##
sudo apt-get update && sudo apt install -y \
    git

##
# Clone repo
##
git clone https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian.git ~/.dotfiles

##
# Checkout the current commit (useful in CI scenarios)
##
if [ -n "${DOTFILES_COMMIT_SHA}" ]; then
    WORKING_DIRECTORY=`pwd`
    cd ~/.dotfiles
    git checkout $DOTFILES_COMMIT_SHA
    cd $WORKING_DIRECTORY
fi

##
# Add to bashrc (if not already added)
##
bashrc=~/.bashrc
cat $bashrc | grep -q "# dotfiles" || (
    echo "" >> $bashrc
    echo "# dotfiles" >> $bashrc
    echo "if [ -f ~/.dotfiles/src/_env.sh ]; then" >> $bashrc
    echo "  source ~/.dotfiles/src/_env.sh" >> $bashrc
    echo "fi" >> $bashrc
    echo "" >> $bashrc
)
source $bashrc

##
# Install
##
export CI=1
~/.dotfiles/src/_install.sh

##
# Print reminder to source
##
echo ""
echo "------------------------------------------------------"
echo "Setup complete."
echo "Run the following commmand to reload the environment."
echo "    source ~/.dotfiles/src/_env.sh"
echo "------------------------------------------------------"
echo ""
