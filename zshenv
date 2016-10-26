typeset -U path
path=(~/bin "$path[@]")

if [ -d /usr/local/var/rbenv ]; then
  export RBENV_ROOT=/usr/local/var/rbenv
  path=($RBENV_ROOT/shims "$path[@]")
fi
