typeset -aU path
path=(~/.local/bin $path)
for file in ~/.zsh/env/*.zsh; do source $file; done
