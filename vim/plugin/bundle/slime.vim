if has('nvim')
  let g:slime_target = "neovim"
else
  let g:slime_target = "tmux"
endif

xmap <localleader>s <Plug>SlimeRegionSend
nmap <localleader>s <Plug>SlimeMotionSend
nmap <localleader>ss <Plug>SlimeLineSend
nmap <localleader>sp <Plug>SlimeParagraphSend
nmap <localleader>sc <Plug>SlimeConfig
