BASE16_SHELL_HOME="$HOME/.config/base16-shell"
BASE16_SHELL_HOOKS="$ZSH_CUSTOM/hooks/base16-shell"

if [ -n "$PS1" ] && [ -s "$BASE16_SHELL_HOME/profile_helper.sh" ]; then
  eval "$("$BASE16_SHELL_HOME/profile_helper.sh")"
  functions[_base16]="$functions[_base16]; _fzf_default_opts_with_colors"
fi
