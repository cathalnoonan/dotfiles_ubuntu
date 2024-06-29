#!/usr/bin/env bash

##
# Alias "ls" to eza
##
if [ -f /usr/bin/eza ]; then
    alias ls='eza -lahF --git'
    alias eza='eza -lahF --git'
    alias exa='eza'
fi
