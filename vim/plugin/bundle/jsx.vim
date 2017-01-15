let g:jsx_ext_required = 0

augroup ReactNativeJsxFileType
autocmd!
autocmd BufNewFile,BufRead *.js
  \ if search('\v<from\s+([''"])react-native\1', 'npw') |
  \   set filetype=javascript.jsx.nr                    |
  \ endif
augroup END
