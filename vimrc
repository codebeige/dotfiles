" yes vim, not vi!
set nocompatible

" load plugins
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" what should be the defaults anyway
syntax enable
filetype plugin indent on
set backspace=indent,eol,start
set hidden
