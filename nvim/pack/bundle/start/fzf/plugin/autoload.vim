if exists('g:loaded_fzf_autoload')
  finish
endif
let g:loaded_fzf_autoload = 1

if !executable('fzf')
  finish
endif

packadd fzf

function! s:Init() abort
  let l:fzf_dir = fnamemodify(resolve(exepath('fzf')), ':p:h:h')
  execute 'source ' . fnameescape(l:fzf_dir) . '/plugin/fzf.vim'
  autocmd! fzf_autoload
endfunction

augroup fzf_autoload
  autocmd!
  autocmd CmdUndefined FZF call s:Init()
  autocmd FuncUndefined fzf#run,fzf#wrap,fzf#shellescape call s:Init()
augroup END
