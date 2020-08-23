#! /usr/bin/env zsh

export BASE16_THEME=ia-light

source $BASE16_SHELL_HOME/scripts/base16-$BASE16_THEME.sh

source $HOME/.config/base16-fzf/bash/base16-$BASE16_THEME.config
echo $FZF_DEFAULT_OPTS > $HOME/.base16_fzf_colors

nvim "+colorscheme base16-$BASE16_THEME" "+Goyo" "+set ft=markdown"
