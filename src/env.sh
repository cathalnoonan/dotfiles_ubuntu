#!/usr/bin/env bash

##
# Handy functions
##
mkcd() {
    ## Make the new directory and CD into it
    # Example: mkcd ~/git/
    mkdir -p "$@" && cd "$_";
}
command_exists() {
    # Usage: command_exists some_command
    # Example: command_exists git
    command -v $1 >/dev/null 2>&1;
}
indent() {
    # Usage: some_command | indent
    # Example: git status | indent
    sed "s/^/$(printf "%${1:-4}s")/"
}

print_color_cyan() {
    local message="$1"
    local color_cyan="\033[1;36m"
    local color_reset="\033[0m"
    printf "${color_cyan}${message}${color_reset}\n"
}
print_color_red() {
    local message="$1"
    local color_red="\033[1;91m"
    local color_reset="\033[0m"
    printf "${color_red}${message}${color_reset}\n"
}
print_color_cyan_then_exec() {
    # Usage: print_color_cyan_then_exec some_command
    # Example: print_color_cyan_then_exec git status
    local command_exec="$@"
    print_color_cyan "${command_exec}"
    $command_exec
    echo;
}
print_then_exec() {
    # Usage: print_then_exec some_command
    # Example: print_then_exec git status
    local command_exec="$@"
    print_color_cyan_then_exec "${command_exec}"
}

big_update() {
    ##
    # Do something with sudo so the password prompt comes up early.
    ##
    sudo echo ""

    if command_exists apt-get
    then
        print_then_exec sudo apt-get update
        print_then_exec sudo apt-get upgrade
        print_then_exec sudo apt-get dist-upgrade
        print_then_exec sudo apt-get autoremove --purge
        print_then_exec sudo apt-get clean
    fi

    if command_exists snap
    then
        print_then_exec sudo snap refresh
    fi

    if command_exists flatpak
    then
        print_then_exec sudo flatpak update
    fi
}

##
# Load other "env.sh" files in nested folders
##
for env_file in ~/.dotfiles/src/*/env.sh
do
    . $env_file
done

##
# Load aliases in nested folders
##
. ~/.dotfiles/src/alias.sh

##
# Helper variables
##
export DOTFILES_IS_WSL=
if [[ $(grep -i Microsoft /proc/version) ]]; then export DOTFILES_IS_WSL=1; fi;
#
export DOTFILES_IS_DOCKER=
if grep -sq 'docker\|lxc' /proc/1/cgroup; then export DOTFILES_IS_DOCKER=1; fi

##
# Customize prompt
##
color_blue="\[\033[01;34m\]"
color_green="\[\033[01;32m\]"
color_red="\[\033[1;91m\]"
color_yellow="\[\033[0;93m\]"
color_reset="\[\033[00m\]"
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="
${debian_chroot:+($debian_chroot)}${color_green}\u@\h${color_reset}:${color_blue}\w${color_yellow}\$(parse_git_branch)$color_reset $ "


if [[ "$DEMO_MODE" == "1" ]] ; then
export PS1="
${color_blue}\w${color_yellow}\$(parse_git_branch)$color_reset $ "
fi
