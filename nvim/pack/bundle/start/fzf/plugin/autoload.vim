if exists('g:loaded_fzf_autoload')
  finish
endif
let g:loaded_fzf_autoload = 1

if !executable('fzf')
  finish
endif

augroup fzf_autoload
  autocmd!
  autocmd FuncUndefined fzf#run,fzf#wrap,fzf#shellescape call fzf#Init()
  autocmd FuncUndefined fzf#vim#* packadd fzf
augroup END
