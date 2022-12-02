#!/usr/bin/env bash

##
# Assign all aliases from all "_alias.sh" files in nested folders
##
for alias_file in ~/.dotfiles/src/*/_alias.sh
do
    . $alias_file
done

##
# Add dotfiles_* aliases
##
alias dotfiles_load="source ~/.dotfiles/src/_env.sh"
alias dotfiles_install="~/.dotfiles/src/_install.sh"
alias dotfiles_update="~/.dotfiles/src/_update.sh"


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
