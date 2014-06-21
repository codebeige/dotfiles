augroup filetype_coffee
  autocmd!
  autocmd FileType coffee setlocal shiftwidth=2 expandtab
  autocmd FileType coffee setlocal suffixesadd=.hamlc,.js.coffee,.coffee,.js
  autocmd FileType coffee setlocal path=app/templates,app,app/config,vendor/assets/javascripts
  autocmd BufNewFile,BufReadPost *_spec.js.coffee UltiSnipsAddFiletypes mocha.coffee
augroup END
