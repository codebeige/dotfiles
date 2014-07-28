alias gcp='git commit -vp'
compdef _git gcp=git-commit

alias gf='git flow'
compdef _git gf=git-flow

alias gff='git diff --ignore-blank-lines'
compdef _git gff=git-diff

alias gp!='git push -f'
compdef _git gp!=git-push

alias gl!='git fetch && git reset --hard origin/$(current_branch)'

alias grb='git rebase'
compdef _git grb=git-rebase
