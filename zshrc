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
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

BUNDLED_COMMANDS=spinach

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  brew
  brew-cask
  coffee
  cp
  git
  git-custom
  git-flow
  lein
  node
  npm
  osx
  per-directory-history
  pow
  powder
  rake
  ruby
  tmuxinator
  vi-mode
)

source $ZSH/oh-my-zsh.sh

###############################################################################

setopt nocorrectall correct nobeep rmstarwait
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
