# switch to iTerm profile by name
chprofile() { echo -e "\033]50;SetProfile=$1\a" }

# toggle solarized theme
toggle_solarized_mode() {
  case ${SOLARIZED_THEME:-dark} in
    light) export SOLARIZED_THEME=dark ;;
    *)     export SOLARIZED_THEME=light;;
  esac
  chprofile "Solarized ${(C)SOLARIZED_THEME}"
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
  chprofile "Solarized ${(C)SOLARIZED_THEME}"
}
alias tgbg=toggle_solarized_mode
