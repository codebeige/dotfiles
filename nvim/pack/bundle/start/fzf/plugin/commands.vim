if exists('g:loaded_fzf_commands')
  finish
endif
let g:loaded_fzf_commands = 1

if !executable('fzf')
  finish
endif

function! s:history(arg, bang)
  let bang = a:bang || a:arg[len(a:arg)-1] == '!'
  if a:arg[0] == ':'
    call fzf#vim#command_history(bang)
  elseif a:arg[0] == '/'
    call fzf#vim#search_history(bang)
  else
    call fzf#vim#history(bang)
  endif
endfunction

command! -bang -nargs=* -complete=dir         FZF       call fzf#Init() | FZF<bang> <args>

command! -bang -nargs=*                       Ag        call fzf#vim#ag(<q-args>, <bang>0)
command! -bang -nargs=? -complete=buffer -bar Buffers   call fzf#vim#buffers(<q-args>, <bang>0)
command! -bang -nargs=*                       BLines    call fzf#vim#buffer_lines(<q-args>, <bang>0)
command! -bang -nargs=*                       BTags     call fzf#vim#buffer_tags(<q-args>, <bang>0)
command! -bang -bar                           BCommits  call fzf#vim#buffer_commits(<bang>0)
command! -bang -bar                           Colors    call fzf#vim#colors(<bang>0)
command! -bang -bar                           Commands  call fzf#vim#commands(<bang>0)
command! -bang -bar                           Commits   call fzf#vim#commits(<bang>0)
command! -bang -nargs=? -complete=dir         Files     call fzf#vim#files(<q-args>, <bang>0)
command! -bang -bar                           Filetypes call fzf#vim#filetypes(<bang>0)
command! -bang -nargs=?                       GitFiles  call fzf#vim#gitfiles(<q-args>, <bang>0)
command! -bang -nargs=?                       GFiles    call fzf#vim#gitfiles(<q-args>, <bang>0)
command! -bang -bar                           Helptags  call fzf#vim#helptags(<bang>0)
command! -bang -nargs=*                       History   call s:history(<q-args>, <bang>0)
command! -bang -nargs=*                       Lines     call fzf#vim#lines(<q-args>, <bang>0)
command! -bang -nargs=+ -complete=dir         Locate    call fzf#vim#locate(<q-args>, <bang>0)
command! -bang -bar                           Marks     call fzf#vim#marks(<bang>0)
command! -bang -bar                           Maps      call fzf#vim#maps("n", <bang>0)
command! -bang -nargs=*                       Rg        call fzf#Rg(<bang>0, <f-args>)
command! -bang -bar                           Snippets  call fzf#vim#snippets(<bang>0)
command! -bang -nargs=*                       Tags      call fzf#vim#tags(<q-args>, <bang>0)
command! -bang -bar                           Windows   call fzf#vim#windows(<bang>0)
