if exists('g:loaded_fzf_autoload')
  finish
endif
let g:loaded_fzf_autoload = 1

if !executable('fzf')
  finish
endif

augroup fzf_autoload
  autocmd!
  autocmd CmdUndefined FZF packadd fzf
  autocmd FuncUndefined fzf#* packadd fzf
augroup END
