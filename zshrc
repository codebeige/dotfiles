# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="codebeige"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Move customization out of original git repo
ZSH_CUSTOM=$HOME/.zsh/config

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  vi-mode
  coffee
  colored-man-pages
  colorize
  copydir
  copyfile
  cp
  docker
  docker-compose
  docker-compose-custom
  git
  git-custom
  git-flow
  git-flow-avh
  lein
  node
  npm
  nvm
  osx
  per-directory-history
  rake
  rbenv
  react-native
  ruby
  tmux
  tmuxinator
  web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG='de_DE.UTF-8'
export LC_ALL='de_DE.UTF-8'
export TERM='xterm-256color'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
