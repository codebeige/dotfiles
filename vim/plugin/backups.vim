set backupdir=~/.vimdir/,./tmp,~/tmp,/var/tmp,/tmp,.
set directory=~/.vimdir/,./tmp//,~/tmp//,/var/tmp//,/tmp//,.

if has("persistent_undo")
  set undodir=~/.vimdir/,./tmp,~/tmp,/var/tmp,/tmp,.
  set undofile
endif
