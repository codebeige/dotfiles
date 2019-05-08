language en_US.UTF-8

set mouse=a
set hidden

let g:mapleader = ','
let g:maplocalleader = ',,'

nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
inoremap <C-U> <C-G>u<C-U>
