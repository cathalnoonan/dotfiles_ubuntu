#!/usr/bin/env bash

##
# Alias "ls" to eza
##
if [ -x "$(command -v eza)" ]; then
    alias ls='eza -lahF --git'
    alias eza='eza -lahF --git'
    alias exa='eza'
fi
