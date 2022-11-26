#!/usr/bin/env bash

##
# Load other _env.sh files in nested folders
##
for env_file in ~/.dotfiles/src/*/_env.sh
do
    . $env_file
done

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
. ~/.dotfiles/src/_alias.sh