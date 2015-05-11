typeset -U path
path=(~/bin "$path[@]")

if which rbenv > /dev/null; then
  if [[ ! -n $RBENV_ROOT ]];then
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "$(rbenv init -)"
  fi
  path=($RBENV_ROOT/shims "$path[@]")
fi

if which brew > /dev/null; then
  if [[ ! -n $NVM_DIR ]];then
    export NVM_DIR=~/.nvm
  fi
  if [[ -f $(brew --prefix nvm)/nvm.sh ]]; then
    source $(brew --prefix nvm)/nvm.sh
  fi
fi
