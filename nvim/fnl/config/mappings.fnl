(module config.mappings
  {autoload {util lib.util}})

; <c-ü> behaves like <c-]>
; <c-ä> behaves like <esc>
; <c-6> behaves like <c-^>
; <c-2> behaves like <c-@>

(def- keymap {"ö"  "["
              "ä"  "]"
              "Ö"  "{"
              "Ä"  "}"
              "öö" "[["
              "ää" "]]"
              "öä" "[]"
              "äö" "]["
              "°"  "~"})

(def- normal-mappings {"<C-L>"      "<Cmd>lua vim.lsp.buf.clear_references()<CR><C-L>"
                       "<CR>"       ":"
                       "<Leader>bb" "<Cmd>checktime<CR>"})

(def- insert-mappings {"<C-L>" "<Esc>"
                       "<C-U>" "<C-G>u<C-U>"})

(each [from to (pairs keymap)]
  (util.map "" from to {:noremap false}))

(each [from to (pairs normal-mappings)]
  (util.map :n from to))

(each [from to (pairs insert-mappings)]
  (util.map :i from to))
