let g:neoterm_default_mod   = "belowright vertical"
let g:neoterm_auto_repl_cmd = 0
let g:neoterm_autoscroll    = 1

nnoremap <silent> <leader>ta :Ttoggle<cr>
nnoremap <silent> <leader>tA :TtoggleAll<cr>
nnoremap <silent> <leader>tn :Tnew<cr>
nnoremap <silent> <leader>to :Topen<cr>
nnoremap <silent> <leader>tä :Tnext<cr>
nnoremap <silent> <leader>tö :Tprevious<cr>
nnoremap <silent> <leader>tc :Tclose<cr>
nnoremap <silent> <leader>tl :Tclear<cr>
nnoremap <silent> <leader>tk :Tkill<cr>
nnoremap <silent> <leader>tm :Tmap<space>

nmap gx  <Plug>(neoterm-repl-send)
xmap gx  <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)

augroup neoterm_clojure
  autocmd!
  autocmd FileType clojure
        \ nmap <buffer> gxx gxaF                                    |
        \ nmap <buffer> K   :T (clojure.repl/doc <C-r><C-w>)<cr>    |
        \ nmap <buffer> gS  :T (clojure.repl/source <C-r><C-w>)<cr>
augroup END
