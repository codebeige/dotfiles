" Make it a real vim
set nocompatible

" Load bundles
silent! call pathogen#infect()
silent! call pathogen#helptags()

""" Appearance
colorscheme solarized
set background=dark

set title
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set showcmd
set showmode

set number
set numberwidth=5

set wrap
set scrolloff=3
set ruler

set visualbell

""" Behaviour
set hidden

set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start

set incsearch
set hlsearch
set ignorecase
set smartcase

""" File handling
set backupdir=$HOME/.vim.bak//,.
set directory=$HOME/.vim.swp//,.

syntax enable
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType ruby setlocal foldmethod=syntax foldlevel=1
autocmd FileType css  setlocal foldmethod=indent foldlevel=1 shiftwidth=2 tabstop=2

""" Mappings
let mapleader=" "

" swap direction for repeat f-movement commands
nnoremap ; ,
nnoremap , ;

vnoremap ; ,
vnoremap , ;

" clear recent search
nnoremap <silent> <Leader><BS> :nohlsearch<Bar>:echo<CR>

""" Bundles

" nerdtree
let NERDTreeHijackNetrw=0
let NERDTreeShowBookmarks=1
nmap <silent> <D-O> :NERDTreeToggle<CR>

" peepopen
map <unique> <silent> <Leader>po <Plug>PeepOpen

" bufexplorer
let g:bufExplorerShowRelativePath=1

" matchit
runtime macros/matchit.vim

" redgreen
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
