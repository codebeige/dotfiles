augroup liquid
  autocmd!
  autocmd BufNewFile,BufRead *.liquid.haml
        \ let b:liquid_subtype = 'haml' | set ft=liquid
augroup END
