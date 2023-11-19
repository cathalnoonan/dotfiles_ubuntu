#!/usr/bin/env bash

##
# Alias "ls" to eza
##
if [ -x "$(command -v eza)" ]; then
    alias ls='eza -laFh --git'
    alias eza='eza -laFh --git'
    alias exa='eza'
fi
