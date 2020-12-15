# Config
# ------
function _fzf_default_opts_with_colors() {
  local fzf_default_bindings=(
    ctrl-a:select-all
    ctrl-d:deselect-all
    ctrl-o:toggle-all
  )
  local fzf_default_opts=(
    $(cat $HOME/.base16_fzf_colors 2>/dev/null)
    --height=40%
    --layout=reverse
    --border
    --multi
    --bind=${(j:,:)fzf_default_bindings}
  )
  export FZF_DEFAULT_OPTS=$fzf_default_opts[*]
}
_fzf_default_opts_with_colors

if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
fi

if (( $+commands[tree] )); then
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
bindkey '^o' fzf-cd-widget
