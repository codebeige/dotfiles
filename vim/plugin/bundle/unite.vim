let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <leader>fd :<C-u>Unite -no-split -start-insert -buffer-name=paths     file_rec/async:!<cr>
nnoremap <leader>ff :<C-u>Unite -no-split -start-insert -buffer-name=files     file<cr>
nnoremap <leader>ft :<C-u>Unite -no-split -start-insert -buffer-name=tags      tag<cr>
nnoremap <leader>fq :<C-u>Unite -no-split -start-insert -buffer-name=commands  history/command<cr>
nnoremap <leader>fs :<C-u>Unite -no-split -start-insert -buffer-name=searches  history/search<cr>

nnoremap <leader>lb :<C-u>Unite -no-split -buffer-name=buffers  buffer<cr>
nnoremap <leader>lr :<C-u>Unite -no-split -buffer-name=history  file_mru<cr>
nnoremap <leader>lf :<C-u>Unite -no-split -buffer-name=files    file<cr>
nnoremap <leader>ly :<C-u>Unite -no-split -buffer-name=yanks    history/yank<cr>
nnoremap <leader>lq :<C-u>Unite -no-split -buffer-name=commands history/command<cr>
nnoremap <leader>ls :<C-u>Unite -no-split -buffer-name=searches history/search<cr>
nnoremap <leader>lm :<C-u>Unite -no-split -buffer-name=marks    mark<cr>

nnoremap <leader>fp :<C-u>Unite -no-split -buffer-name=pattern grep<cr>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-dir .git --ignore-dir tmp'
  let g:unite_source_grep_recursive_opt = ''
endif
