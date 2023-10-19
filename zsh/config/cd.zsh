cdpath=(~ ~/src ~/src/pitch-app/projects ~/lab ~/lib ~/Dropbox/Projects)

hash -d dots=~/dotfiles
alias dots='nocorrect dots'

hash -d src=~/src
hash -d lab=~/lab

mcd() {
  mkdir -p $1 && cd $_
}
compdef mcd=mkdir
