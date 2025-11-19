#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='(\u@\h)-[\w]$(git_branch)\n\$ '

if [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.bash_common ]; then
    . ~/.bash_common
fi

if [ -f ~/.dircolors ]; then
    eval $(dircolors -b ~/.dircolors)
fi

. /usr/share/nvm/init-nvm.sh


# Load Angular CLI autocompletion.
source <(ng completion script)
