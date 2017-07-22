if [ -d "$HOME/.linuxbrew" ]; then
  path=("$HOME/.linuxbrew/bin" "$path[@]")
  MANPATH=":$HOME/.linuxbrew/share/man:$MANPATH"; export MANPATH
  INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"; export INFOPATH
fi
