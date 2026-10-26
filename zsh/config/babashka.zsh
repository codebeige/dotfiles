if (( $+commands[bb] )); then
  source <(bb org.babashka.cli/completions snippet --shell zsh)
fi
