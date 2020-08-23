function! s:wysiwyg_markdown()
  highlight Title gui=bold
  highlight htmlBold gui=bold
  highlight htmlItalic gui=italic
  highlight! link markdownHeadingDelimiter markdownRule
endfunction

function goyo#colors#init()
  augroup wysiwyg_markdown
    autocmd!
    autocmd ColorScheme * call s:wysiwyg_markdown()
  augroup END
  call s:wysiwyg_markdown()
endfunction

function goyo#colors#exit()
  autocmd! wysiwyg_markdown
  highlight clear Title
  highlight clear htmlBold
  highlight clear htmlItalic
  highlight clear markdownHeadingDelimiter
  execute 'colorscheme' g:colors_name
endfunction
