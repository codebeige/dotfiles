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

runtime macros/matchit.vim
runtime macros/justify.vim

""" File handling
set backupdir=$HOME/.vim.bak//,.
set directory=$HOME/.vim.swp//,.

syntax enable
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

""" Mappings
let mapleader=" "

" swap direction for repeat f-movement commands
nnoremap ; ,
nnoremap , ;
vnoremap ; ,
vnoremap , ;

" make German keyboard layout more useful in normal mode
nmap ü `
nmap Ü '
vmap ü `
vmap Ü `

nmap üü ``
nmap ÜÜ ''
vmap üü ``
vmap ÜÜ ''

nmap ö <C-]>
nmap ä <C-t>

" searching
nmap ß /\v
nmap ¿ /
nmap ? ?\v
nmap ˙ ?
nmap ' *

nmap <D-F> :Ack 

" clear recent search
nnoremap <silent> <Leader><BS> :nohlsearch<Bar>:echo<CR>

" shifting indent for selection
nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv

" completion
inoremap <A-Tab> <C-n>
inoremap <A-S-Tab> <C-x><C-o>

""" Bundles

" nerdtree
let NERDTreeHijackNetrw=0
let NERDTreeShowBookmarks=1
nmap <silent> <D-O> :NERDTreeToggle<CR>

" peepopen
map <unique> <silent> <Leader>po <Plug>PeepOpen

" bufexplorer
let g:bufExplorerShowRelativePath=1

" redgreen
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="horizontal"
map <Leader>use :UltiSnipsEdit<CR>
