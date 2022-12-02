
##
# Load other _env.sh files in nested folders
##
for env_file in ~/.dotfiles/src/*/_env.sh
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
. ~/.dotfiles/src/_alias.sh

##
# Helper variables
##
export DOTFILES_IS_WSL=
if [[ $(grep -i Microsoft /proc/version) ]]; then export DOTFILES_IS_WSL=1; fi;
#
export DOTFILES_IS_DOCKER=
if grep -sq 'docker\|lxc' /proc/1/cgroup; then export DOTFILES_IS_DOCKER=1; fi
