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
