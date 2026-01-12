#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=500
HISTFILESIZE=2000
shopt -s histappend
#HISTCONTROL=ignoreboth

PS1='\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w #\[\033[00m\] '

# enable powerline
# https://powerline.readthedocs.io/en/master/usage/shell-prompts.html#bash-prompt
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/share/powerline/bindings/bash/powerline.sh

# enable starship shell prompt
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

source ~/.bash_aliases
source ~/.bash_funcs
source ~/.bash_env

#pokeget random --hide-name | fastfetch --file-raw -

# Created by `pipx` on 2025-11-23 15:00:40
export PATH="$PATH:/home/turtle/.local/bin"
eval "$(register-python-argcomplete pipx)"
