" yes vim, not vi!
set nocompatible

" load plugins
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('bundle/default/{}')

if has('python')
  call pathogen#infect('bundle/python/{}')
endif

if has('nvim')
  call pathogen#infect('bundle/neovim/{}')
endif

" what should be the defaults anyway
syntax enable
filetype plugin indent on
set backspace=indent,eol,start
set hidden

" fix mouse reporting inside tmux sessions
if has('mouse_xterm')
  set ttymouse=xterm2
endif

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

nnoremap gü g]

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
