BASE16_HOME="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_HOME/profile_helper.sh" ] && \
    eval "$("$BASE16_HOME/profile_helper.sh")"
