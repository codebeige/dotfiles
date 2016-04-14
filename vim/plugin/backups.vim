set backupdir=~/.vimdir/,~/tmp,/var/tmp,/tmp,.
set directory=~/.vimdir/,~/tmp//,/var/tmp//,/tmp//,.

if has("persistent_undo")
  set undodir=~/.vimdir/,~/tmp,/var/tmp,/tmp,.
  set undofile
endif
