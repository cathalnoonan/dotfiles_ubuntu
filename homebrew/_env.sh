#!/bin/sh

export HOMEBREW_NO_ANALYTICS=1

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
    # Set PATH, MANPATH, etc., for Homebrew.
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
