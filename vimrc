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

" sensible defaults
set backspace=indent,eol,start
set mouse=a
set title
set laststatus=2
set autoindent
set complete-=i
set nrformats-=octal
set history=1000

" misc
set autoread
set sessionoptions-=options

" macros
runtime macros/matchit.vim

" tabs and shifting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set shiftround

" keyboard

" remember: <c-ü> behaves like <c-]>
" remember: <c-ä> behaves like <esc>
" remember: <c-6> behaves like <c-^>
" remember: <c-2> behaves like <c-@>

map ö [
map ä ]

map ° ~

inoremap <c-l> <c-@>
set timeout
set ttimeout
set ttimeoutlen=100

" mappings
let mapleader=","
let maplocalleader=",,"

" appearance
set number
set numberwidth=5
set cursorline

set wrap
set linebreak
set ruler
set colorcolumn=80

set statusline=[%n]\ %(%h%q%w\ %)%.40f\ %y
set statusline+=%=%m
if exists('g:loaded_fugitive')
  set statusline+=%{fugitive#statusline()}
endif
set statusline+=%20.(%l:%c\ (%L/%p%%)%)

set showcmd
set showmode
set ruler
set visualbell

" find & replace
set incsearch
set nohlsearch
set ignorecase
set smartcase
set infercase

" going wild
set wildmenu
set wildmode=list:longest,full
set wildignore=.DS_Store,.git/,.s[a-z][a-z],.*.sw[a-z],.netrwhist,.nrepl-history
