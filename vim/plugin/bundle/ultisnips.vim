let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets        = "<s-tab>"
noremap <leader>se :UltiSnipsEdit<cr>
noremap <leader>sl :call UltiSnips#ListSnippets()<cr>

augroup plugin_ultisnips
  autocmd!
  autocmd BufNewFile,BufReadPost *_spec{.js}\\\{,1\}.coffee UltiSnipsAddFiletypes mocha.coffee
  autocmd BufNewFile,BufReadPost *_spec.rb UltiSnipsAddFiletypes rspec.ruby
  autocmd BufNewFile,BufReadPost *.liquid.haml UltiSnipsAddFiletypes liquid.haml
  autocmd BufNewFile,BufReadPost *.cljs UltiSnipsAddFiletypes clojurescript.clojure
augroup END
