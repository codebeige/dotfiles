export EDITOR='vim'

export LANG='de_DE.UTF-8'
export LC_ALL='de_DE.UTF-8'
export TERM='xterm-256color'

if which rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

export NVM_DIR=~/.nvm
if which brew > /dev/null 2>&1; then
  if [[ -f $(brew --prefix nvm)/nvm.sh ]]; then
    source $(brew --prefix nvm)/nvm.sh
  fi
fi