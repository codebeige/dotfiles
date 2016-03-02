map <localleader>r :call RunCurrentSpecFile()<CR>
map <localleader>t :call RunNearestSpec()<CR>
map <localleader>a :call RunAllSpecs()<CR>
map <localleader>l :call RunLastSpec()<CR>

let g:rspec_command = 'SlimeSend1 bundle exec rspec {spec}'
