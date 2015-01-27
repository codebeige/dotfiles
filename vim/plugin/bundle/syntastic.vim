let g:syntastic_check_on_wq = 0

if !exists('g:syntastic_html_tidy_ignore_errors')
  let g:syntastic_html_tidy_ignore_errors = []
endif

let g:syntastic_html_tidy_ignore_errors += [
  \   "'<' + '/' + letter not allowed here"
  \ ]

