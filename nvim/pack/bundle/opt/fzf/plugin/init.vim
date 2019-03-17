if exists('g:loaded_fzf_init')
  finish
endif
let g:loaded_fzf_init = 1

let s:fzf_dir = fnamemodify(resolve(exepath('fzf')), ':p:h:h')
execute 'source ' . fnameescape(s:fzf_dir) . '/plugin/fzf.vim'
