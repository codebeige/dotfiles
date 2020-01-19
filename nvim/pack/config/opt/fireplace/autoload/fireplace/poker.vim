function s:set_local_path(response)
  let &l:path = join(a:response.classpath, ',')
endfunction

function s:set_up_classpath()
  let platform = fireplace#platform()
  if platform.HasOp('classpath')
     call platform.Message({'op': 'classpath'}, function('s:set_local_path'))
  endif
endfunction

function fireplace#poker#activate()
  call s:set_up_classpath()
endfunction
