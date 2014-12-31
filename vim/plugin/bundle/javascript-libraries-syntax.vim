let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,requirejs,jasmine,chai'

augroup plugin_javascript_libraries_syntax
  autocmd!
  autocmd FileType javascript,coffee,html,jade set omnifunc=syntaxcomplete#Complete
augroup END
