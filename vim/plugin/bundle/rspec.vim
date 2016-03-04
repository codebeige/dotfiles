let g:rspec_command = 'Dispatch rspec {spec}'

augroup RspecPlugin
  autocmd!
  autocmd BufNewFile,BufRead *_spec.rb
        \ nnoremap <buffer> <localleader>r :call RunCurrentSpecFile()<cr>|
        \ nnoremap <buffer> <localleader>t :call RunNearestSpec()<cr>|
        \ nnoremap <buffer> <localleader>a :call RunAllSpecs()<cr>
  autocmd Filetype ruby
        \ nnoremap <buffer> <localleader>l :call RunLastSpec()<cr>
augroup END
