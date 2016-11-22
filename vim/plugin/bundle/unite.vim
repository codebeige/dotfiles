let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

nnoremap <leader>fd :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=paths     file_rec/async:!<cr>
nnoremap <leader>ff :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=files     file<cr>
nnoremap <leader>ft :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=tags      tag<cr>
nnoremap <leader>fq :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=commands  history/command<cr>
nnoremap <leader>fs :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=searches  history/search<cr>
nnoremap <leader>fo :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=outline   outline<cr>
nnoremap <leader>fq :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=quickfix  quickfix<cr>
nnoremap <leader>fl :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=locations location_list<cr>
nnoremap <leader>fm :<C-u>Unite -no-split -no-empty -start-insert -buffer-name=mappings  mapping<cr>

nnoremap <leader>fg :<C-u>Unite -no-split -buffer-name=project grep/git:!<cr>
nnoremap <leader>fp :<C-u>Unite -no-split -buffer-name=pattern grep:!<cr>

nnoremap <leader>lb :<C-u>Unite -no-split -no-empty -buffer-name=buffers   buffer<cr>
nnoremap <leader>lr :<C-u>Unite -no-split -no-empty -buffer-name=history   file_mru<cr>
nnoremap <leader>lf :<C-u>Unite -no-split -no-empty -buffer-name=files     file<cr>
nnoremap <leader>ly :<C-u>Unite -no-split -no-empty -buffer-name=yanks     history/yank<cr>
nnoremap <leader>lq :<C-u>Unite -no-split -no-empty -buffer-name=commands  history/command<cr>
nnoremap <leader>ls :<C-u>Unite -no-split -no-empty -buffer-name=searches  history/search<cr>
nnoremap <leader>lm :<C-u>Unite -no-split -no-empty -buffer-name=marks     mark<cr>
nnoremap <leader>lo :<C-u>Unite -no-split -no-empty -buffer-name=outline   outline<cr>
nnoremap <leader>lq :<C-u>Unite -no-split -no-empty -buffer-name=quickfix  quickfix<cr>
nnoremap <leader>ll :<C-u>Unite -no-split -no-empty -buffer-name=locations location_list<cr>
nnoremap <leader>lj :<C-u>Unite -no-split -no-empty -buffer-name=jumps     jump<cr>
nnoremap <leader>lc :<C-u>Unite -no-split -no-empty -buffer-name=changes   change<cr>

augroup Unite_Plugin
  autocmd!
  autocmd Filetype unite call s:init_buffer()
augroup END

function! s:init_buffer()
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-x> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-x> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

if executable('ag')
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--follow --nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = ''
endif
