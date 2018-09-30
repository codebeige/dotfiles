export EDITOR='nvim -e'
export VISUAL='nvim'

alias vim=nvim
alias vi=nvim

export VIMCONFIG=~/.vim
[[ ! -d $VIMCONFIG ]] && mkdir -p $VIMCONFIG

export VIMDATA=~/.local/share/vim
[[ ! -d $VIMDATA ]] && mkdir -p $VIMDATA
