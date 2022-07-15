# MINIMUM BASHRC

# HISTORY
HISTSIZE=500
HISTFILESIZE=1000
# append to history file
shopt -s histappend
# ignore duplicate lines or lines starting with space
HISTCONTROL=ignoreboth

# COLORPROMPT
# magenta & blue
#PS1='\[\033[35m\]\u@\h\[\033[00m\] \[\033[34m\]\w #\[\033[00m\] '
# bold red & bold blue
PS1='\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w #\[\033[00m\] '
# no color
#PS1='\u@\h:\w\$ '

# ALIAS
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
