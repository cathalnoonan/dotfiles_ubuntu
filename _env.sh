#!/usr/bin/env bash

export DOTFILES_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

##
# Load other _env.sh files in nested folders
##
for env_file in $DOTFILES_ROOT/*/_env.sh
do
    . $env_file
done

##
# Customise Prompt(s)
# - Removes hostname and username
# - %L is the shell level
# - Starts a new line for each command
PROMPT='
[%L] %1~ %# '
# - Adds the time to the right when entering a command
RPROMPT='%*'
##

##
# Handy functions
##
function mkcd(){
    ## Make the new directory and CD into it
    mkdir -p "$@" && cd "$_";
}

##
# Load aliases in nested folders
##
. $DOTFILES_ROOT/_alias.sh