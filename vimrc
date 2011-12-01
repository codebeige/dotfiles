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
set linebreak
set ruler

set mouse=a
set visualbell

""" Behaviour
set hidden
set history=50

set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start

set incsearch
set ignorecase
set smartcase

runtime macros/matchit.vim
runtime macros/justify.vim

""" File handling
set backupdir=$HOME/.vim.bak//,.
set directory=$HOME/.vim.swp//,.
syntax enable
filetype plugin indent on

set makeprg=rake

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

""" Mappings
let mapleader=" "

map ß <C-]>

map ° ~

map ü `
map Ü '
map üü ``
map ÜÜ ''

" toggle hlsearch
map <Leader>hl  :set hlsearch!<cr> 

" clear recent search
nnoremap <silent> <Leader><BS> :nohlsearch<Bar>:echo<CR>

""" Bundles

" solarized
call togglebg#map("<F5>")

" nerdtree
let g:NERDTreeHijackNetrw=1
let g:NERDTreeWinSize=35
nmap <silent> <F6>        :NERDTreeToggle<CR>
nmap <silent> <leader>ntf :NERDTreeFind<CR>
nmap <silent> <Leader>ntt :NERDTreeToggle<CR>

" peepopen
map <unique> <silent> <Leader>po <Plug>PeepOpen

" bufexplorer
let g:bufExplorerShowRelativePath=1

" makegreen
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec
map <unique> <silent> <Leader>mg :call MakeGreen()<cr>

" ultisnips
let g:UltiSnipsListSnippets = "<s-tab>" 
let g:UltiSnipsEditSplit    = "horizontal"
map <Leader>use :UltiSnipsEdit<CR>
	
" toggle invisibles
map <Leader>i :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" command-t
let g:CommandTAcceptSelectionMap=['<CR>', '<Space>']
let g:CommandTAcceptSelectionSplitMap=['<C-s>', '<C-CR>', '<M-Space>']

" specky
let g:speckyRunSpecCmd       = "bundle exec rspec -r ~/.vim/bundle/specky/ruby/specky_formatter.rb -f SpeckyFormatter"
let g:speckyQuoteSwitcherKey = "<Leader>:"

" bdd
map <leader>ca  :wa<bar>!bundle exec cucumber features<cr>
map <leader>cw  :wa<bar>!bundle exec cucumber -p wip<cr>
map <leader>c%  :wa<bar>!bundle exec cucumber %<cr>

map <leader>ra  :wa<bar>!bundle exec rspec spec<cr>
map <leader>r%  :wa<bar>let g:RspecRecentTestFile=expand('%:p')<bar>!bundle exec rspec --format=documentation %<cr>
map <leader>rr  :wa<bar>execute("!bundle exec rspec --format=documentation " . g:RspecRecentTestFile)<cr>

" Rails stuff
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" CoffeScript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenablet
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
