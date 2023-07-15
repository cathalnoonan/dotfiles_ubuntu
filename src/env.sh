#!/usr/bin/env bash

##
# Load other "env.sh" files in nested folders
##
for env_file in ~/.dotfiles/src/*/env.sh
do
    . $env_file
done

##
# Handy functions
##
function mkcd(){
    ## Make the new directory and CD into it
    mkdir -p "$@" && cd "$_";
}

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
