autoload -U add-zsh-hook

function _update_tmux_environment {
  tmux show-environment | grep -v '^-' |
  while IFS= read -r line; do eval $(printf %q $line); done
}

if [[ -n "$TMUX" ]]; then
  add-zsh-hook preexec _update_tmux_environment
fi

alias ts!='tmux new-session -s $PWD:t'
alias mux=tmuxinator

function tx() {
  tmux -CC new-session -A -s "${1-$PWD:t}"
}

TPM_ROOT="${TMUX_PLUGIN_MANAGER_PATH:=$HOME/.config/tmux/plugins/}tpm"
if [[ ! -d $TPM_ROOT ]]; then
  git clone https://github.com/tmux-plugins/tpm $TPM_ROOT
  $TPM_ROOT/bin/install_plugins
fi
export TMUX_PLUGIN_MANAGER_PATH
