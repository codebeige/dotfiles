[[ -v KITTY_PID ]] || return

export KITTY_THEMES=~/.config/kitty/themes

function kitty-set-theme {
  local name=${1:-$(cat ~/.colortheme 2>/dev/null)}
  echo ${name:=base16-tomorrow-night-eighties-256} >| ~/.colortheme
  kitty @ set-colors --all --configured $KITTY_THEMES/$name.conf
  local background_color=$(kitty @ get-colors | rg '^background\s+' --replace '')
  kitty @ set-colors --all --configured cursor_text_color=$background_color
}


function kitty-switch-theme {
  local name=$(
    ls $KITTY_THEMES/ \
    | xargs basename -s .conf \
    | fzf --preview "head -n 20 $KITTY_THEMES/{}.conf && kitty @ set-colors $KITTY_THEMES/{}.conf"
  )
  kitty-set-theme $name
}

kitty-set-theme
