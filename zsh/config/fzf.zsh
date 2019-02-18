# Config
# ------
export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border --multi'

if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
bindkey '^v' fzf-cd-widget
