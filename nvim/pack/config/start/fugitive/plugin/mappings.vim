function! s:ToggleGitStatus()
    if buflisted(bufname('.git/index'))
        bdelete .git/index
    else
        Git
    endif
endfunction

command ToggleGitStatus call s:ToggleGitStatus()
nnoremap <Leader>gg <Cmd>ToggleGitStatus<CR>


nnoremap <Leader>gs <Cmd>Git<CR>
nnoremap <Leader>gc <Cmd>Git commit<CR>
nnoremap <Leader>gh <Cmd>Git log -10<CR>
nnoremap <Leader>gm <Cmd>Git mergetool<CR>

nnoremap <Leader>gfd <Cmd>Gdiffsplit<CR>
nnoremap <Leader>gfh <Cmd>Git log -10 -- %<CR>
nnoremap <Leader>gfb <Cmd>Git blame<CR>

" nnoremap <Leader>gf <Cmd>Git fetch --all --prune --jobs=10<CR>
nnoremap <Leader>gl <Cmd>Git pull<CR>
nnoremap <Leader>gL <Cmd>Git pull --force<CR>
nnoremap <Leader>gp <Cmd>Git push<CR>
nnoremap <Leader>gP <Cmd>Git push --force<CR>
