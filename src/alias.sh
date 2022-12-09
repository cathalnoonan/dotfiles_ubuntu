#!/usr/bin/env bash

##
# Assign all aliases from all "alias.sh" files in nested folders
##
for alias_file in ~/.dotfiles/src/*/alias.sh
do
    . $alias_file
done

##
# Add dotfiles_* aliases
##
alias dotfiles_load="source ~/.dotfiles/src/env.sh"
alias dotfiles_install="~/.dotfiles/src/install.sh"
alias dotfiles_update="~/.dotfiles/src/update.sh"

##
# Windows-style aliases
##
alias dir='ls'
alias cls='clear'
