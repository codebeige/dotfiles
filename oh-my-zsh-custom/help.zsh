if [[ "$SHELL" == '/usr/local/bin/zsh' ]]; then
  unalias run-help
  autoload run-help
  HELPDIR=/usr/local/share/zsh/help
fi
