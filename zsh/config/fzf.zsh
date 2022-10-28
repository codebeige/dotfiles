# Config
# ------
function () {
  local bindings=(
    ctrl-a:select-all
    ctrl-d:deselect-all
    ctrl-o:toggle-all
  )
  local opts=(
    --height=40%
    --layout=reverse
    --border
    --multi
    --bind=${(j:,:)bindings}
  )
  export FZF_DEFAULT_OPTS=$opts[*]
}

if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
fi

if (( $+commands[tree] )); then
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
bindkey '^o' fzf-cd-widget
