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

" simulate word blocks with pipe chars
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" toggle hlsearch
map <Leader>hl  :set hlsearch!<cr> 

" clear recent search
nnoremap <silent> <Leader><BS> :nohlsearch<Bar>:echo<CR>

" tabs
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tc :tabclose<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>
map tv :tabedit<Space>$MYVIMRC<CR>

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""" Bundles

" solarized
call togglebg#map("<F5>")

" nerdtree
let g:NERDTreeHijackNetrw=1
let g:NERDTreeWinSize=35
nmap <silent> <F6>        :NERDTreeToggle<CR>
nmap <silent> <leader>ntf :NERDTreeFind<CR>
nmap <silent> <Leader>ntt :NERDTreeToggle<CR>

" bufexplorer
let g:bufExplorerShowRelativePath=1

" ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<C-Tab>"
let g:UltiSnipsEditSplit    = "horizontal"
map <Leader>snip :UltiSnipsEdit<CR>
	
" toggle invisibles
map <Leader>i :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" simplefold
map <silent> <Leader>z <Plug>SimpleFold_Foldsearch

" command-t
nnoremap <silent> <Leader>f :CommandT<CR>
let g:CommandTAcceptSelectionMap=['<CR>']
let g:CommandTAcceptSelectionSplitMap=['<C-i>']

" ctrlP
let g:ctrlp_mruf_exclude='/tmp/.*\|/temp/.*'
let g:ctrlp_dotfiles=0
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir']

" Rails stuff
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

" CoffeScript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" delimitMate
let g:delimitMate_excluded_regions = ""
let g:delimitMate_expand_space     = 1
let g:delimitMate_expand_cr        = 1

" SQL
let g:sql_type_default       = 'pgsql'
let g:dbext_default_type     = 'PGSQL'
let g:ftplugin_sql_omni_key  = '<C-x>'
let g:omni_sql_include_owner = 0

" Markdown Preview
" let g:MarkdownPreviewTMP           = '~/.vim/bundle/markdown-preview/tmp/'
" let g:MarkdownPreviewDefaultStyles = '~/.vim/bundle/markdown-preview/stylesheets/'
" let g:MarkdownPreviewDefaultTheme    = 'readable'
let g:MarkdownPreviewAlwaysOpen      = 1

autocmd BufNewFile,BufReadPost *.mkd,*.md,*.markdown,*.mdown map <buffer> <leader>b :MDP<CR>

"" Scripts & commands

" bdd
map <leader>ca  :wa<bar>!bundle exec cucumber features<cr>
map <leader>cw  :wa<bar>!bundle exec cucumber -p wip<cr>
map <leader>c%  :wa<bar>!bundle exec cucumber %<cr>

map <leader>ra  :wa<bar>!bundle exec rspec spec<cr>
map <leader>r%  :wa<bar>let g:RspecRecentTestFile=expand('%:p')<bar>!bundle exec rspec --format=documentation %<cr>
map <leader>rr  :wa<bar>execute("!bundle exec rspec --format=documentation " . g:RspecRecentTestFile)<cr>
