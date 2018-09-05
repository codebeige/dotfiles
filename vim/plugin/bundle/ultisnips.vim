let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets        = "<s-tab>"
noremap <leader>se :UltiSnipsEdit<cr>
noremap <leader>sl :call UltiSnips#ListSnippets()<cr>

augroup plugin_ultisnips
  autocmd!
  autocmd BufNewFile,BufReadPost *_spec{.js}\\\{,1\}.coffee silent! UltiSnipsAddFiletypes mocha.coffee
  autocmd BufNewFile,BufReadPost *_spec.rb silent! UltiSnipsAddFiletypes rspec.ruby
  autocmd BufNewFile,BufReadPost *.liquid.haml silent! UltiSnipsAddFiletypes liquid.haml
  autocmd BufNewFile,BufReadPost *.cljs silent! UltiSnipsAddFiletypes clojurescript.clojure
augroup END
