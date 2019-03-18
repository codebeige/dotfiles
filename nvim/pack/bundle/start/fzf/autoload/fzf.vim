function! fzf#Init() abort
  let l:fzf_dir = fnamemodify(resolve(exepath('fzf')), ':p:h:h')
  execute 'source ' . fnameescape(l:fzf_dir) . '/plugin/fzf.vim'
endfunction
