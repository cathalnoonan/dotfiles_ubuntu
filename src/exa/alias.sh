#!/usr/bin/env bash

##
# Alias "ls" to exa
##
if [ -x "$(command -v exa)" ]; then
    alias ls='exa -laFh --git'
    alias exa='exa -laFh --git'
fi
