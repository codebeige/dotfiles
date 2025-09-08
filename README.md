# Codebeige Dotfiles

This repository includes my personal configuration and utility scripts for
quick system setup. You are welcome to find inspiration or reuse any useful
elements, but please do so at your own risk.

## Setup

### Install Apple Commandline Tools

```zsh
xcode-select --install
```

### Clone repository

```zsh
git clone git@github.com:codebeige/dotfiles.git ~/dotfiles
```

### Install Oh-My-Zsh

```zsh
CHSH=no RUN_ZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Apps and CLI tools

```zsh
brew bundle install --file ~/dotfiles/Brewfile
```

### Finally, create symlinks for all configuration files

```zsh
bb init
```
