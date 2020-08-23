function goyo#options#init()
  let s:original_linebreak=&linebreak
  set linebreak
  let s:original_cursorline=&cursorline
  set nocursorline
  let s:original_showmode=&showmode
  set noshowmode
  let s:original_conceallevel=&conceallevel
  set conceallevel=2
endfunction

function goyo#options#exit()
  let &linebreak=s:original_linebreak
  let &cursorline=s:original_cursorline
  let &showmode=s:original_showmode
  let &conceallevel=s:original_conceallevel
endfunction
