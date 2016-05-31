function! ruby#rspec_fold()
  let line = getline(v:lnum)
  let indent = indent(v:lnum)
  let level = indent / &shiftwidth

  if line =~ '^\s*$'
    return '-1'
  elseif line =~? '\v^\s*%(describe|context|it|before|after|let|scenario|background)>.*do\s*$'
    return '>' . level
  elseif line =~? '\v^\s{' . indent . '}end>'
    return '<' . level
  else
    return '='
  endif
endfunction

function! ruby#rspec_foldtext()
  let line = getline(v:foldstart)
  return substitute(line, '\v\C^s*(.+)\s*do\s*$', '\1', '')
endfunction
