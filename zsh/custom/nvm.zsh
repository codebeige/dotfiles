if which brew > /dev/null 2>&1; then
  if [[ -f $(brew --prefix nvm)/nvm.sh ]]; then
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
  fi
fi
