export PATH=$HOME/bin:$PATH:/usr/local/share/npm/bin

if which rbenv > /dev/null; then
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi
