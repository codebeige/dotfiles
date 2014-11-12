typeset -U path
path=(~/bin "$path[@]")

if which rbenv > /dev/null; then
  if [[ ! -n $RBENV_ROOT ]];then
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "$(rbenv init -)"
  fi
  path=($RBENV_ROOT/shims "$path[@]")
fi
