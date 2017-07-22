if [ $(command -v direnv 2>&1) ]; then
  eval "$(direnv hook zsh)"
fi
