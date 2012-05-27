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
set nohlsearch

set infercase
" set spell
set spelllang=en_us

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
 
map ° ~

map ö [
map ä ]
" remember: <c-ü> behaves like <c-]>

map <leader>q :cclose<cr>

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
map <leader>hl  :set hlsearch!<cr> 

" clear recent search
nnoremap <silent> <leader><bs> :nohlsearch<bar>:echo<cr>

" insert line delimiter and enter newline
autocmd BufNewFile,BufReadPost *.pde,*.js map <leader><cr> A;<esc>

" path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set path+=test/**,spec/**,app/**,lib/**,config/**

" Change cursor in insert mode
let &t_SI = "\<esc>]50;CursorShape=1\x7"
let &t_EI = "\<esc>]50;CursorShape=0\x7"

" OmniCompletion
if has("autocmd") && exists("+omnifunc")            
  autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif

""" Bundles

" solarized
call togglebg#map("<f5>")

" nerdtree
let g:NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=50
nmap <silent> <f6>        :NERDTreeToggle<cr>
nmap <silent> <leader>tt  :NERDTreeToggle<cr>
nmap <silent> <leader>tf  :NERDTreeFind<cr>

" bufexplorer
let g:bufExplorerShowRelativePath=1

" ultisnips
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsEditSplit          = "horizontal"
	
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets        = "<s-tab>"
map <leader><tab> :UltiSnipsEdit<cr>

" toggle invisibles
map <leader>i :set list!<cr>
set listchars=tab:▸\ ,eol:¬

" simplefold
map <silent> <leader>z <plug>SimpleFold_Foldsearch

" ctrlP
let g:ctrlp_mruf_exclude='/tmp/.*\|/temp/.*'
let g:ctrlp_dotfiles=0
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir']

" Rails stuff
autocmd User Rails Rnavcommand sass app/assets/stylesheets -glob=**/* -suffix=.sass
autocmd User Rails Rnavcommand feature features -suffix=.feature
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
autocmd User Rails map <leader>r :Rake<cr>
autocmd User Rails/**/*.rb setlocal filetype=ruby.rails
autocmd User Rails/spec/**/*_spec.rb setlocal filetype=ruby.rails.minispec

" Rake
autocmd User Rake map <leader>r :Rake<cr>

" CoffeScript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Smartinput
call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#define_rule({'at': '\%#', 'char': '#', 'input': '#{}<left>', 'filetype': ['ruby', 'coffee'], 'syntax': ['Constant', 'Special']})

call smartinput#map_to_trigger('i', '<bar>', '<bar>', '<bar>')
call smartinput#define_rule({'at': '\({\|\<do\>\)\s*\%#', 'char': '<bar>', 'input': '<bar><bar><left>', 'filetype': ['ruby']})

" SQL
let g:sql_type_default       = 'pgsql'
let g:dbext_default_type     = 'PGSQL'
let g:ftplugin_sql_omni_key  = '<c-x>'
let g:omni_sql_include_owner = 0

" Hammer
autocmd BufNewFile,BufReadPost *.mkd,*.md,*.markdown,*.mdown,*.html,*.xhtml map <buffer> <leader>b :Hammer<cr>

" RagTag
let g:ragtag_global_maps = 1

"" Scripts & commands

" bdd
autocmd BufNewFile,BufReadPost *.coffee map <leader>b :wa<bar>:silent !rake browser<cr>

" processing
let processing_doc_path="/Applications/Processing.app/Contents/Resources/Java/modes/java/reference"
autocmd BufNewFile,BufReadPost *.pde map <leader>r :w<bar>silent execute "!osascript $PROCESSING_HOME/scripts/run.applescript"<bar>redraw!<cr>

" ruby specs
autocmd BufNewFile,BufReadPost *_spec.rb set filetype=ruby.minispec

" ctags
map <leader>ü !ctags -R --exclude=.git --languages=-javascript,sql<cr>

" tagbar
nmap <f8> :TagbarToggle<cr>
