" Make it a real vim
set nocompatible

""" Load bundles
runtime bundle/pathogen/autoload/pathogen.vim
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

au VimEnter * NoMatchParen
nmap ,nmp :NoMatchParen<cr>
nmap ,dmp :DoMatchParen<cr>

""" File handling
set noswapfile
set backupdir=$HOME/.vim.bak//,.
set directory=$HOME/.vim.swp//,.
syntax enable
filetype plugin indent on

set makeprg=rake

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

""" Clipboard
" set clipboard=unnamed

""" Mappings
let mapleader=","
 
map ° ~

nnoremap ' `
nnoremap ` '
nnoremap ´ '

map ö [
map ä ]

" remember: <c-ü> behaves like <c-]>
" remember: <c-ä> behaves like <esc>
" remember: <c-6> behaves like <c-^>

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
autocmd User Rails/**/*.rb UltiSnipsAddFiletypes rails.ruby
autocmd User Rails/spec/**/*_spec.rb UltiSnipsAddFiletypes rspec.rails.ruby

" Rake
autocmd User Rake map <leader>r :Rake<cr>

" CoffeScript
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *_spec.js.coffee UltiSnipsAddFiletypes mocha.coffee
autocmd BufNewFile,BufReadPost *.coffee normal zR

" Smartinput
call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#define_rule({'at': '\%#', 'char': '#', 'input': '#{}<left>', 'filetype': ['ruby'], 'syntax': ['Constant', 'Special']})

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

""" Scripts & commands

" processing
let processing_doc_path="/Applications/Processing.app/Contents/Resources/Java/modes/java/reference"
autocmd BufNewFile,BufReadPost *.pde map <leader>r :w<bar>silent execute "!osascript $PROCESSING_HOME/scripts/run.applescript"<bar>redraw!<cr>

" ctags
map <leader>ü !ctags -R --exclude=.git --languages=-javascript,sql<cr>

" tagbar
nmap <f8> :TagbarToggle<cr>

" HAML assets
autocmd BufNewFile,BufReadPost *.hamlc set filetype=haml

" Spinach
autocmd User Rails/features/*.feature  let b:rails_alternate = substitute(rails#buffer().path() , 'features/\(.*\)\.feature' , 'features/steps/\1.rb' , '')
autocmd User Rails/features/steps/*.rb let b:rails_alternate = substitute(rails#buffer().path() , 'features/steps/\(.*\)\.rb' , 'features/\1.feature' , '')
autocmd User Rails/features/*          let b:rails_related   = b:rails_root . '/features/support/env.rb'
autocmd User Rails/features/*.feature  nmap <buffer> <leader>sc :execute '!spinach' rails#buffer().path()<cr>
autocmd User Rails/features/steps/*.rb nmap <buffer> <leader>sc :execute '!spinach' b:rails_alternate<cr>
autocmd User Rails/features/*          nmap <buffer> <leader>sw :execute '!rake' 'spinach:wip'<cr>
autocmd User Rails/features/*.feature  let b:rails_alternate = substitute(rails#buffer().path() , 'features/\(.*\)\.feature' , 'features/steps/\1.rb' , '')
autocmd User Rails/features/*.feature  UltiSnipsAddFiletypes gherkin

" Backbone development
autocmd User Rails/app/*.js.coffee       let b:rails_alternate = substitute(rails#buffer().path() , 'app/\(.*\)\.js\.coffee'            , 'spec/\1_spec.js.coffee' , '')
autocmd User Rails/spec/*_spec.js.coffee let b:rails_alternate = substitute(rails#buffer().path() , 'spec/\(.*\)_spec\.js\.coffee'      , 'app/\1.js.coffee'       , '')
autocmd User Rails/app/*_view.js.coffee  let b:rails_related   = substitute(rails#buffer().path() , 'app/views/\(.*\)_view\.js\.coffee' , 'app/templates/\1.hamlc' , '')

" Konacha
autocmd User Rails/spec/*_spec.js.coffee let b:konacha_url = substitute( rails#buffer().path() , b:rails_root . '/spec/\(.*\)_spec\.js\.coffee' , 'http://localhost:3500/\1' , '' )
autocmd User Rails/app/*.js.coffee       let b:konacha_url = substitute( rails#buffer().path() , b:rails_root . '/app/\(.*\)\.js\.coffee'       , 'http://localhost:3500/\1' , '' )
autocmd User Rails/*.js.coffee nmap <buffer> <leader>kr :execute '!open' '-a "Google Chrome"' b:konacha_url<bar>!osascript -e 'tell application "iTerm" to activate'<cr>:redraw!<cr>
autocmd User Rails/*.js.coffee nmap <buffer> <leader>ko :execute '!open' '-a "Google Chrome"' b:konacha_url<cr><cr>
autocmd User Rails/*.js.coffee nmap <buffer> <leader>ka :!open http://localhost:3500<cr><cr>

" disable automatic linebreaks
autocmd FileType vim set textwidth=0

" vim: set fdm=expr fde=getline(v\:lnum)=~'"""'?'>1'\:'=':
