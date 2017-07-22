typeset -U path

path=(~/bin /usr/local/bin "$path[@]")

if [ -d "$HOME/.linuxbrew" ]; then
  path=("$HOME/.linuxbrew/bin" "$path[@]")
  MANPATH=":$HOME/.linuxbrew/share/man:$MANPATH"; export MANPATH
  INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"; export INFOPATH
fi

if [ $(command -v direnv 2>&1) ]; then
  eval "$(direnv hook zsh)"
fi

export RBENV_ROOT=~/.rbenv
path=(~/bin $RBENV_ROOT/shims "$path[@]")

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
