(module mappings
  {autoload {util lib.util}})

; <c-ü> behaves like <c-]>
; <c-ä> behaves like <esc>
; <c-6> behaves like <c-^>
; <c-2> behaves like <c-@>

(util.map "ö" "[")
(util.map "ä" "]")
(util.map "Ö" "{")
(util.map "Ä" "}")

(util.map "öö" "[[")
(util.map "ää" "]]")
(util.map "öä" "[]")
(util.map "äö" "][")

(util.map "°" "~")

(util.noremap! :n "<C-L>" ":nohlsearch<Bar>diffupdate<CR><C-L>")
(util.noremap! :i "<C-L>" "<Esc>")
(util.noremap! :i "<C-U>" "<C-G>u<C-U>")

(util.noremap :n "<Leader>bb" ":checktime<CR>")
