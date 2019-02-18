# util
inside-git-repository() {
  git rev-parse HEAD > /dev/null 2>&1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

fzf-down() {
  fzf-tmux --height 50% "$@" --border
}

# helpers

fzf-git-file() {
  inside-git-repository || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

fzf-git-branch() {
  inside-git-repository || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

fzf-git-tag() {
  inside-git-repository || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

fzf-git-hash() {
  inside-git-repository || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

fzf-git-remote() {
  inside-git-repository || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

# bindings
bind-fzf-git-widget() {
  eval "${2}-widget() { local result=\$($2 | join-lines); zle reset-prompt; LBUFFER+=\$result }"
  eval "zle -N ${2}-widget"
  eval "bindkey '$1' ${2}-widget"
}

bind-fzf-git-widget '^gf' fzf-git-file
bind-fzf-git-widget '^gb' fzf-git-branch
bind-fzf-git-widget '^gt' fzf-git-tag
bind-fzf-git-widget '^gh' fzf-git-hash
bind-fzf-git-widget '^gr' fzf-git-remote

unset -f bind-fzf-git-widget
