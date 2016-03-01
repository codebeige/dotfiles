let g:indentLine_enabled = 0
let g:indentLine_char    = '┊'
let g:indentLine_leadingSpaceChar = '·'

nnoremap <localleader>coi :IndentLinesToggle<cr>
nnoremap <localleader>[oi :IndentLinesEnable<cr>
nnoremap <localleader>öoi :IndentLinesEnable<cr>
nnoremap <localleader>]oi :IndentLinesDisable<cr>
nnoremap <localleader>äoi :IndentLinesDisable<cr>

nnoremap <localleader>cos :LeadingSpaceToggle<cr>
nnoremap <localleader>[os :LeadingSpaceEnable<cr>
nnoremap <localleader>öos :LeadingSpaceEnable<cr>
nnoremap <localleader>]os :LeadingSpaceDisable<cr>
nnoremap <localleader>äos :LeadingSpaceDisable<cr>
