alias l='ls -1'
alias ls='ls --color=auto'
alias ll='ls -o'
alias la='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias icat='kitten icat'

alias reload_waybar='pkill waybar && hyprctl dispatch exec waybar'

alias vim='nvim'
alias pman='sudo pacman'
if type bat &> /dev/null; then
    alias cat='bat --plain'
fi
