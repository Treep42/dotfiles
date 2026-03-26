alias l='ls -1'
alias ls='ls --color=auto'
alias ll='ls -o'
alias la='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias icat='kitten icat'

alias reload_waybar='pkill waybar && hyprctl dispatch exec waybar'

alias keydb='/data/work/git/KeyDB/src/keydb-server /data/work/git/KeyDB/keydb.conf'
alias frontend='cd /data/work/git/WizFrontend/ && npm run dev'
alias wizid='cd /data/work/git/WizIdentity/build && ./WizIdentity -c ../my.wizIdentity.conf --dev-assets ../assets/'
alias wizidcli='cd /data/work/git/WizIdentity/build/tools/wizid-cli && ./wizid-cli'
alias keydbcli='cd /data/work/git/KeyDB/src/ && ./keydb-cli'

alias vim='nvim'
alias pman='sudo pacman'
if type bat &> /dev/null; then
    alias cat='bat --plain'
fi
