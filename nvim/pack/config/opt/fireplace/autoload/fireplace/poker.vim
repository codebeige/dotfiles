function s:set_local_path(response)
  let &l:path = join(a:response.classpath, ',')
endfunction

function fireplace#poker#update_classpath()
  let platform = fireplace#platform()
  if platform.HasOp('classpath')
     let response = platform.Message({'op': 'classpath'}, v:t_dict)
     call s:set_local_path(response)
  endif
  return ''
endfunction

function s:set_up_classpath()
  let platform = fireplace#platform()
  if platform.HasOp('classpath')
     call platform.Message({'op': 'classpath'}, function('s:set_local_path'))
  endif
endfunction

function s:wrap_go_to_file_mappings()
  cmap <buffer><expr> <Plug><FireplacePokerUpdateClasspath> fireplace#poker#update_classpath()
  cmap <buffer> <C-R><C-F> <Plug><FireplacePokerUpdateClasspath><Plug><cfile>
  cmap <buffer> <C-R><C-P> <Plug><FireplacePokerUpdateClasspath><Plug><cpath>

  nmap <buffer><silent> gf         :<C-U>call fireplace#poker#update_classpath()<CR><Plug>FireplaceEditFile
  nmap <buffer><silent> <C-W>f     :<C-U>call fireplace#poker#update_classpath()<CR><Plug>FireplaceSplitFile
  nmap <buffer><silent> <C-W><C-F> :<C-U>call fireplace#poker#update_classpath()<CR><Plug>FireplaceSplitFile
  nmap <buffer><silent> <C-W>gf    :<C-U>call fireplace#poker#update_classpath()<CR><Plug>FireplaceTabeditFile
endfunction

function s:set_up_K()
  nnoremap <buffer> K :Eval (clojure.repl/doc <C-R><C-W>)<CR>
endfunction

function fireplace#poker#activate()
  call s:set_up_classpath()
  call s:wrap_go_to_file_mappings()
  call s:set_up_K()
endfunction
