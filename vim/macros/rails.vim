silent! Rlcd

if g:ackprg !~ ' --ignore-dir=coverage --ruby --js --yaml --html'
  let g:ackprg .= ' --ignore-dir=coverage --ruby --js --yaml --html'
endif

