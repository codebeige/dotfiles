typeset -U path
path=(~/bin /usr/local/bin /usr/local/sbin "$path[@]")
for file in ~/.zsh/env/*.zsh; do source $file; done
