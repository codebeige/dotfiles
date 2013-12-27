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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras git-flow-avh osx ruby rake bundler brew pow powder rails vi-mode node npm coffee)

source $ZSH/oh-my-zsh.sh

setopt nocorrectall correct nobeep rmstarwait

export EDITOR='vim'
export PROCESSING_HOME=$HOME/Documents/Processing
export HOMEBREW_NO_EMOJI=1
export PSQL_EDITOR='vim -c"set syntax=pgsql"'
export NODE_PATH="/usr/local/lib/node"

cdpath=($HOME/src $HOME/src/* $HOME/opt $HOME/Documents $HOME/Dropbox/dotfiles)
hash -d dots=$HOME/Dropbox/dotfiles
hash -d brew=/usr/local

alias java6='export JAVA_HOME=`/usr/libexec/java_home -v "1.6*"`'

alias viminit='vim -u ~/.vim/bundles.vim +BundleInstall +q'
