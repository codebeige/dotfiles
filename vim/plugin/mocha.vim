augroup plugin_mocha
  autocmd!
  autocmd BufNewFile,BufReadPost *_spec.js.coffee UltiSnipsAddFiletypes mocha.coffee
augroup END
