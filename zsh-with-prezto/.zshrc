#
# Executes commands at the start of an interactive session.
#
# Original authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
# and modified here by
#   CJ Harries <cj@wizardsoftheweb.pro>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt auto_name_dirs

source .zalias

if which keepass; then
  export SSH_AUTH_SOCK=/tmp/$USER/ssh-keeagent.sock
  unset SSH_ASKPASS
fi
