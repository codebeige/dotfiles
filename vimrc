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
set history=200

set wildmenu
set wildmode=list:longest,full

set backspace=indent,eol,start

set incsearch
set ignorecase
set smartcase
set hlsearch

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
let mapleader=","

" do not use esc
noremap  <C-ä>  <Esc>
noremap! <C-ä>  <Esc>
 
map ° ~

map ö [
map ä ]

map <leader>cc :cclose<cr>

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

" insert line delimiter and enter newline
autocmd BufNewFile,BufReadPost *.pde,*.js map <leader><cr> A;<esc>

" path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set path+=test/**,spec/**,app/**,lib/**,config/**

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""" Bundles

" solarized
call togglebg#map("<F5>")

" nerdtree
let g:NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=50
nmap <silent> <F6>        :NERDTreeToggle<CR>
nmap <silent> <Leader>tt  :NERDTreeToggle<CR>
nmap <silent> <leader>tf  :NERDTreeFind<CR>

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

" ctrlP
let g:ctrlp_mruf_exclude='/tmp/.*\|/temp/.*'
let g:ctrlp_dotfiles=0
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir']

" Rails stuff
autocmd User Rails Rnavcommand sass app/assets/stylesheets -glob=**/* -suffix=.sass
autocmd User Rails Rnavcommand feature features -suffix=.feature
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
autocmd User Rails map <leader>r :Rake<cr>

" CoffeScript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Smartinput
call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#define_rule({'at': '\%#', 'char': '#', 'input': '#{}<Left>', 'filetype': ['ruby', 'coffee'], 'syntax': ['Constant', 'Special']})

call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
call smartinput#define_rule({'at': '\({\|\<do\>\)\s*\%#', 'char': '<Bar>', 'input': '<Bar><Bar><Left>', 'filetype': ['ruby']})

" SQL
let g:sql_type_default       = 'pgsql'
let g:dbext_default_type     = 'PGSQL'
let g:ftplugin_sql_omni_key  = '<C-x>'
let g:omni_sql_include_owner = 0

" Hammer
autocmd BufNewFile,BufReadPost *.mkd,*.md,*.markdown,*.mdown,*.html,*.xhtml map <buffer> <leader>b :Hammer<CR>

" RagTag
let g:ragtag_global_maps = 1

"" Scripts & commands

" bdd
autocmd BufNewFile,BufReadPost *.coffee map <leader>b :wa<bar>:silent !rake browser<cr>

" processing
let processing_doc_path="/Applications/Processing.app/Contents/Resources/Java/modes/java/reference"
autocmd BufNewFile,BufReadPost *.pde map <leader>r :w<bar>silent execute "!osascript $PROCESSING_HOME/scripts/run.applescript"<bar>redraw!<cr>
