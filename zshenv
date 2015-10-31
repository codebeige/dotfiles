typeset -U path
path=(~/bin "$path[@]")

export RBENV_ROOT=/usr/local/var/rbenv
path=($RBENV_ROOT/shims "$path[@]")
