typeset -U path
path=(~/bin /usr/local/bin "$path[@]")
for file in ~/.zsh/env/*.zsh; do source $file; done
