""" Load bundles using Vundle
source ~/.vim/bundles.vim

""" Appearance
colorscheme solarized

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
set cursorline

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


" au VimEnter * NoMatchParen
noremap ]om :NoMatchParen<cr>
noremap [om :DoMatchParen<cr>

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


""" Mappings
let mapleader=","
let maplovalleader="-"
 
map ° ~

nnoremap ' `
nnoremap ` '
nnoremap ´ '

map ö [
map ä ]

" remember: <c-ü> behaves like <c-]>
" remember: <c-ä> behaves like <esc>
" remember: <c-6> behaves like <c-^>

noremap <leader>q :cclose<cr>

" simulate word blocks with pipe chars
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,https://github.com/rking/ag.vim.git

" Expand active file dir
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Change cursor in insert mode
let &t_SI = "\<esc>]50;CursorShape=1\x7"
let &t_EI = "\<esc>]50;CursorShape=0\x7"

" OmniCompletion
if has("autocmd") && exists("+omnifunc")            
  augroup file_type_omni_completion
    autocmd!
    autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
  augroup END
endif

" Toggle folds
nnoremap <space> za

" Edit .vimrc
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>


""" Bundles

" solarized
call togglebg#map("<f5>")

" nerdtree
let g:NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=50
noremap <silent> <leader>ft  :NERDTreeToggle<cr>
noremap <silent> <leader>ff  :NERDTreeFind<cr>

" bufexplorer
let g:bufExplorerShowRelativePath=1

" ultisnips
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsEditSplit          = "horizontal"
	
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets        = "<s-tab>"
noremap <leader>se :UltiSnipsEdit<cr>
noremap <leader>ss :UltiSnipsEdit<cr>

" toggle invisibles
noremap <leader>i :set list!<cr>
set listchars=tab:▸\ ,eol:¬

" simplefold
noremap <silent> <leader>z <plug>SimpleFold_Foldsearch

" ctrlP
let g:ctrlp_custom_ignore = '\v[\/]stats$'
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
let g:ctrlp_dotfiles = 0
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir']
let g:ctrlp_arg_map = 1

" Smartinput
" call smartinput#map_to_trigger('i', '#', '#', '#')
" call smartinput#define_rule({'at': '\%#', 'char': '#', 'input': '#{}<left>', 'filetype': ['ruby'], 'syntax': ['Constant', 'Special']})

call smartinput#map_to_trigger('i', '<bar>', '<bar>', '<bar>')
call smartinput#define_rule({'at': '\({\|\<do\>\)\s*\%#', 'char': '<bar>', 'input': '<bar><bar><left>', 'filetype': ['ruby']})

" SQL
let g:sql_type_default       = 'pgsql'
let g:dbext_default_type     = 'PGSQL'
let g:ftplugin_sql_omni_key  = '<c-x>'
let g:omni_sql_include_owner = 0

" RagTag
let g:ragtag_global_maps = 1

" DWM
let g:dwm_map_keys=0

" Processing
let g:use_processing_java=1
noremap <leader>rp :RunProcessing<cr><cr>

" tagbar
noremap <leader>to :TagbarOpenAutoClose<cr>
noremap <leader>tt :TagbarToggle<cr>

let g:tagbar_iconchars = ['▸', '▾']

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

""" Scripts & commands

" processing
let processing_doc_path="/Applications/Processing.app/Contents/Resources/Java/modes/java/reference"
augroup buffer_processing
  autocmd!
  autocmd BufNewFile,BufReadPost *.pde noremap <leader>r :w<bar>silent execute "!osascript $PROCESSING_HOME/scripts/run.applescript"<bar>redraw!<cr>
augroup END

" ctags
noremap <leader>ü !ctags -R<cr>

" gist
let g:gist_clip_command = 'pbcopy'


""" FileTypes

" all
augroup file_type_all
  autocmd!
  autocmd BufWinENter * normal zR
augroup END

" VimScript
augroup file_type_vim
  autocmd!
  autocmd FileType vim set textwidth=0
augroup END

" HAMLCoffee
augroup file_type_hamlc
  autocmd!
  autocmd BufNewFile,BufReadPost *.hamlc set filetype=haml
augroup END

" CoffeScript
augroup file_type_coffee
  autocmd!
  autocmd FileType coffee setlocal shiftwidth=2 expandtab
  autocmd FileType coffee setlocal suffixesadd+=.js.coffee,.coffee,.js
  autocmd FileType coffee setlocal path+=vendor/assets/javascripts
  autocmd BufNewFile,BufReadPost *_spec.js.coffee UltiSnipsAddFiletypes mocha.coffee
augroup END

" Hammer
augroup buffer_hammer
  autocmd!
  autocmd BufNewFile,BufReadPost *.mkd,*.md,*.markdown,*.mdown,*.html,*.xhtml map <buffer> <leader>b :Hammer<cr>
augroup END

 
""" Commands
command! Path :call EchoPath()
function! EchoPath()
  echo join(split(&path, ","), "\n")
endfunction

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

" vim: set fdm=expr fde=getline(v\:lnum)=~'"""'?'>1'\:'=':
