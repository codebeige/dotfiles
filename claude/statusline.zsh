#!/usr/bin/env zsh

setopt extended_glob

input=$(cat)

model=$(print -r -- "$input" | jq -r '.model.display_name // .model.id // "?"')
model_id=$(print -r -- "$input" | jq -r '.model.id // empty')
tokens=$(print -r -- "$input" | jq -r '.context_window.total_input_tokens // empty')
max_tokens=$(print -r -- "$input" | jq -r '.context_window.context_window_size // empty')
dir=$(print -r -- "$input" | jq -r '.workspace.current_dir // .cwd // empty')

# Local Ollama sessions are capped at 64K; warn well before that.
limit=50000

# Local if Claude Code is pointed at a loopback base URL, or the model id
# looks like an Ollama tag (contains a colon; Claude ids never do).
local_model=0
if [[ "$ANTHROPIC_BASE_URL" == *(localhost|127.0.0.1)* || "$model_id" == *:* ]]; then
  local_model=1
fi

work_dir_suffix=""
if [[ -n "$dir" ]]; then
  work_dir_suffix=" · ${dir/#$HOME/~}"
  branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n "$branch" ]]; then
    [[ "$branch" == "HEAD" ]] && branch=$(git -C "$dir" rev-parse --short HEAD 2>/dev/null)
    work_dir_suffix+=" [${branch}]"
  fi
fi

if [[ -z "$tokens" ]]; then
  print -r -- "$model · ctx: n/a${work_dir_suffix}"
  exit 0
fi

pretty="$(printf "%.1f" $(( tokens / 1000.0 )))K"

if [[ -n "$max_tokens" ]]; then
  pretty+="/$(( (max_tokens + 500) / 1000 ))K"
fi

# Match the auto mode indicator, which the TUI paints in the active theme's
# "warning" color. The statusline payload has no theme, so resolve it from the
# global config; custom themes live in ~/.claude/themes/<slug>.json.
theme=$(jq -r '.theme // empty' ~/.claude.json 2>/dev/null)
: ${theme:=dark}

spec=""
custom=~/.claude/themes/${theme}.json
if [[ -f "$custom" ]]; then
  spec=$(jq -r '.overrides.warning // empty' "$custom" 2>/dev/null)
  [[ -z "$spec" ]] && theme=$(jq -r '.base // "dark"' "$custom" 2>/dev/null)
fi

if [[ -z "$spec" ]]; then
  case "$theme" in
    light)            spec="rgb(150,108,30)" ;;
    light-ansi)       spec="ansi:yellow" ;;
    dark-ansi)        spec="ansi:yellowBright" ;;
    light-daltonized) spec="rgb(255,153,0)" ;;
    dark-daltonized)  spec="rgb(255,204,0)" ;;
    *)                spec="rgb(255,193,7)" ;;  # dark, auto, unknown slugs
  esac
fi

typeset -A ansi_codes=(
  black 30 red 31 green 32 yellow 33 blue 34 magenta 35 cyan 36 white 37
  blackBright 90 redBright 91 greenBright 92 yellowBright 93 blueBright 94
  magentaBright 95 cyanBright 96 whiteBright 97
)

warn_color=""
if [[ "$spec" == rgb\(*\) ]]; then
  rgb=${spec//[^0-9,]/}
  warn_color=$'\e[38;2;'"${rgb//,/;}"m
elif [[ "$spec" == \#[0-9a-fA-F](#c6) ]]; then
  hex=${spec#\#}
  warn_color=$'\e[38;2;'"$((16#${hex[1,2]}));$((16#${hex[3,4]}));$((16#${hex[5,6]}))"m
elif [[ "$spec" == ansi:* ]]; then
  code=${ansi_codes[${spec#ansi:}]}
  [[ -n "$code" ]] && warn_color=$'\e['"$code"m
fi

reset=""
[[ -n "$warn_color" ]] && reset=$'\e[39m'

if (( local_model && tokens >= limit )); then
  print -r -- "$model · ${pretty} ${warn_color}⚠ compact${reset}${work_dir_suffix}"
else
  print -r -- "$model · ${pretty}${work_dir_suffix}"
fi
