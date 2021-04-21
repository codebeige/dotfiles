sign define LspDiagnosticsSignError       text=! texthl=LspDiagnosticsSignError
sign define LspDiagnosticsSignWarning     text=* texthl=LspDiagnosticsSignWarning
sign define LspDiagnosticsSignInformation text=~ texthl=LspDiagnosticsSignInformation
sign define LspDiagnosticsSignHint        text=- texthl=LspDiagnosticsSignHint

set signcolumn=yes
set numberwidth=2

function! s:highlight_diagnistics()
  highlight link LspDiagnosticsDefaultError       GitGutterDelete
  highlight link LspDiagnosticsDefaultWarning     Todo
  highlight link LspDiagnosticsDefaultInformation GitGutterChange
  highlight link LspDiagnosticsDefaulHint         GitGutterAdd
endfunction

augroup extend_colorscheme
    autocmd!
    autocmd ColorScheme * call s:highlight_diagnistics()
augroup END

call s:highlight_diagnistics()
