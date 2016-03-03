nnoremap <localleader>f :call RunCurrentSpecFile()<CR>
nnoremap <localleader>t :call RunNearestSpec()<CR>
nnoremap <localleader>a :call RunAllSpecs()<CR>
nnoremap <localleader>l :call RunLastSpec()<CR>

let g:rspec_command = 'Dispatch -compiler=rspec' .
                    \ ' bundle exec rspec' .
                    \ ' --format progress --out tmp/test.report' .
                    \ ' --format progress' .
                    \ ' {spec}'
