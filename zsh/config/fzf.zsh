# Config
# ------
fzf_default_bindings=(
  ctrl-a:select-all
  ctrl-d:deselect-all
  ctrl-o:toggle-all
)

fzf_default_opts=(
  --height=40%
  --layout=reverse
  --border
  --multi
  --bind=${(j:,:)fzf_default_bindings}
)

export FZF_DEFAULT_OPTS=$fzf_default_opts[*]

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
