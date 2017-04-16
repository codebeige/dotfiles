cdpath=(~ ~/src ~/lab ~/lib ~/Dropbox/Projects)

hash -d dots=~/dotfiles
hash -d src=~/src
hash -d lab=~/lab
hash -d lib=~/lib
hash -d projects=~/Dropbox/Projects/

mcd() {
  mkdir -p $1 && cd $_
}
compdef mcd=mkdir
