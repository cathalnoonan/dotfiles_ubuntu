#!/usr/bin/env bash

##
# Add alias to re-process environment
##
alias dotfiles_load="source ~/.dotfiles/_env.sh"

##
# Alias a install command
##
alias dotfiles_install="~/.dotfiles/_install.sh"

##
# Assign all aliases from all "_alias.sh" files in nested folders
##
for alias_file in ~/.dotfiles/*/_alias.sh
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
