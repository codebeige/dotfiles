" git
nmap <Leader>fg :<C-U>GFiles<CR>
" directory
nmap <Leader>fd :<C-U>Files<CR>
" files
nmap <Leader>ff :<C-U>History<CR>
" index
nmap <Leader>fi :<C-U>Locate<Space>
" edits
nmap <Leader>fe :<C-U>GFiles?<CR>
" versions
nmap <Leader>fv :<C-U>Commits<CR>
" keys
nmap <Leader>fk :<C-U>Maps<CR>

nmap <Leader>fb :<C-U>Buffers<CR>
nmap <Leader>fc :<C-U>Commands<CR>
nmap <Leader>fh :<C-U>silent! helptags ALL<CR>:Helptags<CR>
nmap <Leader>fl :<C-U>Lines<CR>
nmap <Leader>fm :<C-U>Marks<CR>
nmap <Leader>fs :<C-U>Snippets<CR>
nmap <Leader>ft :<C-U>Tags<CR>
nmap <Leader>fw :<C-U>Windows<CR>

nmap <LocalLeader>fl :<C-U>BLines<CR>
nmap <LocalLeader>ft :<C-U>BTags<CR>
nmap <LocalLeader>fv :<C-U>BCommits<CR> " versions

nmap <Leader>/ :<C-U>Rg<CR>
" regex
nmap <Leader>fr :<C-U>Rg<Space>

nmap <Leader>f/ :<C-U>History/<CR>
nmap <Leader>f: :<C-U>History:<CR>
