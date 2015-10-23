" This is an adaption of textobj-entire by Kana Natsuno
" <https://github.com/kana/vim-textobj-entire>

if exists('g:loaded_textobj_buffer')
  finish
endif

call textobj#user#plugin('buffer', {
\      '-': {
\        '*sfile*': expand('<sfile>:p'),
\        'select-a': 'ab',  '*select-a-function*': 's:select_a',
\        'select-i': 'ib',  '*select-i-function*': 's:select_i'
\      }
\    })

function! s:select_a()
  mark '

  keepjumps normal! gg0
  let start_pos = getpos('.')

  keepjumps normal! G$
  let end_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

function! s:select_i()
  mark '

  keepjumps normal! gg0
  call search('^.', 'cW')
  let start_pos = getpos('.')

  keepjumps normal! G$
  call search('^.', 'bcW')
  normal! $
  let end_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

let g:loaded_textobj_buffer = 1
