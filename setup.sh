#!/usr/bin/env bash

# GitHub action logging functions
gha_group_start() {
    if [ "$GHA" != "" ]; then
        echo "::group:: $1"
    fi
}
gha_group_end() {
    if [ "$GHA" != "" ]; then
        echo "::endgroup::"
    fi
}

##
# Install prerequisites
##
gha_group_start "Install git"
sudo apt-get update && sudo apt-get install -y \
    git
gha_group_end

##
# Clone repo
##
gha_group_start "Clone repo"
git clone https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian.git ~/.dotfiles
gha_group_end

##
# Checkout the current commit (useful in CI scenarios)
##
if [ -n "${DOTFILES_COMMIT_SHA}" ]; then
    gha_group_start "Checkout commit: $DOTFILES_COMMIT_SHA"
    WORKING_DIRECTORY=$(pwd)
    cd ~/.dotfiles
    git checkout $DOTFILES_COMMIT_SHA
    cd $WORKING_DIRECTORY
    gha_group_end
fi

##
# Add to bashrc (if not already added)
##
gha_group_start 'Append to $HOME/.bashrc'
bashrc=$HOME/.bashrc
cat $bashrc | grep -q "# dotfiles" || (
    echo "" >> $bashrc
    echo "# dotfiles" >> $bashrc
    echo 'if [ -f $HOME/.dotfiles/src/env.sh ]; then' >> $bashrc
    echo '    source $HOME/.dotfiles/src/env.sh' >> $bashrc
    echo "fi" >> $bashrc
    echo "" >> $bashrc

    echo "Appended dotfiles"
)
source $bashrc
gha_group_end

##
# Install
##
export CI=1
$HOME/.dotfiles/src/install.sh

##
# Print reminder to source
##
echo ""
echo "------------------------------------------------------"
echo "Setup complete."
echo "Run the following commmand to reload the environment."
echo "    source ~/.dotfiles/src/env.sh"
echo "------------------------------------------------------"
echo ""
