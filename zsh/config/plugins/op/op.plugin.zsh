# Do nothing if not installed
(( ${+commands[op]} )) || return

# Load op completion
eval "$(op completion zsh)"
compdef _op op

# Initialize plugins
source ~/.config/op/plugins.sh
