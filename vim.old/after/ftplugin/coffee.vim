function! CoffeeScriptFolds()
  if getline(v:lnum) =~ '->\s*$'
    return ">" . indent(v:lnum) / 2
  endif
  return "="
endfunction

function! CoffeeScriptFoldText()
  let foldsize = v:foldend - v:foldstart
  return getline(v:foldstart) . " [" . foldsize . " lines] "
endfunction

setlocal foldmethod=expr
setlocal foldexpr=CoffeeScriptFolds()
setlocal foldtext=CoffeeScriptFoldText()
