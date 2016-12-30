let s:vimdir = expand('~/.vimdir')
call system('mkdir ' . s:vimdir)

call system('mkdir ' . s:vimdir . '/backup')
set backupdir=~/.vimdir/backup,~/tmp,/var/tmp,/tmp,.

call system('mkdir ' . s:vimdir . '/swap')
set directory=~/.vimdir/swap,~/tmp//,/var/tmp//,/tmp//,.

if has("persistent_undo")
  call system('mkdir ' . s:vimdir . '/undo')
  set undodir=~/.vimdir/undo,~/tmp,/var/tmp,/tmp,.
  set undofile
endif
