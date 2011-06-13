set nocompatible                  " Must come first because it changes other options.

" Autoload plugins
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set viminfo^=!                    " Configure viminfo for global variables 

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set scrolloff=3                   " Show 3 lines of context around the cursor.
set sidescroll=1

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" set tabstop=2                   " Global tab width.
" set shiftwidth=2                " And again, related.
set expandtab                     " Use spaces instead of tabs

set nowrap
set textwidth=110
set formatoptions-=t

set grepprg=egrep\ -nH\ $*\ /dev/null

" set timeoutlen=700
set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%{exists('g:loaded_rvm')?Rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Adjust mappings for German keyboard layout
nmap ß /
nmap ü `
nmap Ü '
nmap üü ``
nmap ÜÜ ''
nmap ö [
nmap ä ]
nmap ää ]]
nmap öö [[
nmap Ö {
nmap Ä }
" noremap  
map ä ]
map gä g]
map g g

" Arrow keys in insert mode on a Mac
set t_ku=^[OA
set t_kd=^[OB
set t_kr=^[OC
set t_kl=^[OD

" Easy ESC
map  <D-CR> <ESC>:w<CR>
map! <D-CR> <ESC>:w<CR>

" Custom leader
let mapleader = " "
let maplocalleader = " "

nmap <leader>o <Plug>PeepOpen
nmap <leader>f :FuzzyFinderTextMate<cr>

" <b>rowse
nmap <leader>bf :NERDTreeToggle<cr>
nmap <leader>bt :TlistToggle<cr>
" nmap <leader>bp <Plug>ToggleProject
nmap <leader>br :TRecentlyUsedFiles<cr>
nmap <leader>by :YRShow<cr>

" <t>ab
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit 
nmap <leader>tc :tabclose<cr>
nmap <leader>to :tabonly<cr>
nmap <leader>tä :tabnext<cr>
nmap <leader>tö :tabprevious<cr>
nmap <leader>tm :tabmove 

" <d>ebug
nmap <leader>db :call g:RubyDebugger.toggle_breakpoint()<cr>
nmap <leader>dv :call g:RubyDebugger.open_variables()<cr>
nmap <leader>dm :call g:RubyDebugger.open_breakpoints()<cr>
nmap <leader>dt :call g:RubyDebugger.open_frames()<cr>
nmap <leader>ds :call g:RubyDebugger.step()<cr>
nmap <leader>df :call g:RubyDebugger.finish()<cr>
nmap <leader>dn :call g:RubyDebugger.next()<cr>
nmap <leader>dc :call g:RubyDebugger.continue()<cr>
nmap <leader>de :call g:RubyDebugger.exit()<cr>
nmap <leader>dd :call g:RubyDebugger.remove_breakpoints()<cr>

" Automatic fold settings for specific files
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType sql setlocal foldmethod=indent shiftwidth=4 tabstop=4
autocmd FileType * normal zR


"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"Supertab
let g:SuperTabDefaultCompletionType = "context"

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Yankring
let g:yankring_history_file = '.vim/tmp/yankring_history'
set pastetoggle=¥ " <alt-y>

" Configure Taglist
let Tlist_WinWidth = 40
let Tlist_Sort_Type = 'name'
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1

" Configure NERDTree
let NERDTreeWinSize       = 40
let NERDTreeChDirMode     = 2  " Always change working directory according to root
let NERDTreeIgnore        = ['\~$', '^Icon']

" projects.vim
let g:proj_window_width = 40

" Rails
" command -bar -nargs=1 OpenURL :!open -a Firefox <args>
command -bar -nargs=1 OpenURL :!open <args>

" Ruby debugger
let g:ruby_debugger_progname = 'mvim'

" Colors
colorscheme twilight

" dictionaries
set dictionary+=/usr/share/dict/words
set dictionary+=~/Library/Spelling/LocalDictionary
