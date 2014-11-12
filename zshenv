export PATH=$HOME/bin:$PATH:/usr/local/share/npm/bin

export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"

if which rbenv > /dev/null; then
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi

if which direnv > /dev/null; then
  eval "$(direnv hook $0)"
fi
