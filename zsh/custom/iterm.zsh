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
    export ITERM_PROFILE="$1"
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

  # source theme file
  reload_theme() {
    if [ ! "$ZSH_THEME" = ""  ]; then
      if [ -f "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme" ]; then
        source "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme"
      elif [ -f "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme" ]; then
        source "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme"
      else
        source "$ZSH/themes/$ZSH_THEME.zsh-theme"
      fi
    fi
  }

  toggle_background_mode() {
    if [[ "$ITERM_PROFILE" =~ '^(.*)(Dark|Light)(.*)$' ]]; then
      case $match[2] in
        Dark)  change_profile "$match[1]Light$match[3]";;
        Light) change_profile "$match[1]Dark$match[3]" ;;
      esac
      reload_theme
    fi
  }
  alias tgm=toggle_background_mode

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
