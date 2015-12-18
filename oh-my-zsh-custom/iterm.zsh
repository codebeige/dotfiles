if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  # wrap sequence for tmux
  trigger_escape_code() {
    if (($+TMUX)); then
      print -n -- "\033Ptmux;\033$1\033\\"
    else
      print -n -- "$1"
    fi
  }

  # switch to iTerm profile by name
  change_profile() {
    trigger_escape_code "\033]50;SetProfile=$1\a"
  }

  # set cursor shape (0: block, 1:vertical bar, 2:underline)
  change_cursor_shape() {
    trigger_escape_code "\033]50;CursorShape=$1\a"
  }

  # clear scrollback history
  clear_scrollback() {
    trigger_escape_code "\033]50;ClearScrollback\a"
  }

  # toggle solarized theme
  toggle_solarized_mode() {
    case ${SOLARIZED_THEME:-dark} in
      light) export SOLARIZED_THEME=dark ;;
      *)     export SOLARIZED_THEME=light;;
    esac
    change_profile "Solarized ${(C)SOLARIZED_THEME}"
    clear_scrollback
    source "$ZSH/themes/$ZSH_THEME.zsh-theme"
  }
  alias tgm=toggle_solarized_mode

  # change cursor according to vi-mode
  function zle-line-init {
    change_cursor_shape 2
  }

  function zle-line-finish {
    change_cursor_shape 0
  }

  function zle-keymap-select {
    case $KEYMAP in
      vicmd)      change_cursor_shape 0;;
      viins|main) change_cursor_shape 2;;
    esac

    zle reset-prompt
    zle -R
  }

  zle -N zle-line-init
  zle -N zle-line-finish
  zle -N zle-keymap-select
fi
