# Do nothing if not installed
(( ${+commands[op]} )) || return

# Load op completion
eval "$(op completion zsh)"
compdef _op op

# Initialize plugins
if [ -f ~/.config/op/plugins.sh ]; then
  source ~/.config/op/plugins.sh
fi
