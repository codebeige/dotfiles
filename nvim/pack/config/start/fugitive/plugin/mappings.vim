function! s:ToggleGitStatus()
    if buflisted(bufname('.git/index'))
        bdelete .git/index
    else
        Git
    endif
endfunction

command ToggleGitStatus call s:ToggleGitStatus()
nnoremap <Leader>gg <Cmd>ToggleGitStatus<CR>


nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gh :Git log -10<CR>
nnoremap <Leader>gm :Git mergetool<CR>

nnoremap <Leader>gfd :Gdiffsplit<CR>
nnoremap <Leader>gfh :Git log -10 -- %<CR>
nnoremap <Leader>gfb :Git blame<CR>

nnoremap <Leader>gf :Git fetch --all --prune --jobs=10<CR>
nnoremap <Leader>gl :Git pull<CR>
nnoremap <Leader>gL :Git pull --force<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gP :Git push --force<CR>

augroup fugitive_config
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
