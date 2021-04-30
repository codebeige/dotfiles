"git
nmap <leader>fg <cmd>GFiles<cr>
" directory
nmap <leader>fd <cmd>Files<cr>
" files
nmap <leader>ff <cmd>History<cr>
" index
nmap <leader>fi <cmd>Locate<space>
" edits
nmap <leader>fe <cmd>GFiles?<cr>
" versions
nmap <leader>fv <cmd>Commits<cr>
" keys
nmap <leader>fk <cmd>Maps<cr>

nmap <leader>fb <cmd>Buffers<cr>
nmap <leader>fc <cmd>Commands<cr>
nmap <leader>fh <cmd>silent! helptags ALL<cr>:Helptags<cr>
nmap <leader>fl <cmd>Lines<cr>
nmap <leader>fm <cmd>Marks<cr>
nmap <leader>fs <cmd>Snippets<cr>
nmap <leader>ft <cmd>Tags<cr>
nmap <leader>fw <cmd>Windows<cr>

nmap <localleader>fl <cmd>BLines<cr>
nmap <localleader>ft <cmd>BTags<cr>
nmap <localleader>fv <cmd>BCommits<cr> " versions

" regex
nmap <leader>fr <cmd>Rg<cr>
nmap <leader>* <cmd>Rg --fixed-strings --word-regexp <c-r><c-w><cr>
nmap <leader># <leader>*
nmap <leader>/ <cmd>Rg<space>

nmap <leader>f/ <cmd>History/<cr>
nmap <leader>f: <cmd>History:<cr>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-f><tab>    <plug>(fzf-maps-i)

imap <c-f><c-k> <plug>(fzf-complete-word)
imap <c-f><c-f> <plug>(fzf-complete-path)
imap <c-f><c-j> <plug>(fzf-complete-file-ag)
imap <c-f><c-l> <plug>(fzf-complete-line)
