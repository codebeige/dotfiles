cdpath=(~ ~/src ~/lab ~/lib ~/Dropbox/Projects)

hash -d dots=~/dotfiles
alias dots='nocorrect dots'

hash -d src=~/src
hash -d lab=~/lab
hash -d lib=~/lib
hash -d projects=~/Dropbox/Projects/

mcd() {
  mkdir -p $1 && cd $_
}
compdef mcd=mkdir
