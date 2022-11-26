#!/usr/bin/env bash

DOTFILES_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

##
# Add alias to re-process environment
##
alias dotfiles_load="source $DOTFILES_ROOT/_env.sh"

##
# Alias a install command
##
alias dotfiles_install="$DOTFILES_ROOT/_install.sh"

##
# Assign all aliases from all "_alias.sh" files in nested folders
##
for alias_file in $DOTFILES_ROOT/*/_alias.sh
do
    . $alias_file
done

##
# Alias "ls" to exa
##
if [ -x "$(command -v exa)" ]
    then
        alias ls='exa -laFh --git'
        alias exa='exa -laFh --git'
fi

##
# Windows-style aliases
##
alias dir='ls'
alias cls='clear'
