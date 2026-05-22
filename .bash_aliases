alias l='ls -1'
alias ls='ls --color=auto --hyperlink=auto'
alias ll='ls -o'
alias la='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias icat='kitten icat'
alias vim='nvim'
alias pman='sudo pacman'
alias music='rmpc'
if type bat &> /dev/null; then
    alias cat='bat --plain'
fi
