map <localleader>f :call RunCurrentSpecFile()<CR>
map <localleader>t :call RunNearestSpec()<CR>
map <localleader>a :call RunAllSpecs()<CR>
map <localleader>l :call RunLastSpec()<CR>

let g:rspec_command = 'Dispatch -compiler=rspec' .
                    \ ' bundle exec rspec' .
                    \ ' --format progress --out tmp/test.report' .
                    \ ' --format progress' .
                    \ ' {spec}'
