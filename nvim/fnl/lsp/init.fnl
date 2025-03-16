(fn format-range []
  (let [view (vim.fn.winsaveview)]
    (pcall #(vim.lsp.buf.range_formatting
              {}
              (vim.api.nvim_buf_get_mark 0 "[")
              (vim.api.nvim_buf_get_mark 0 "]")))
    (vim.fn.restview view)))

(fn format-move []
  (set vim.g.__operatorfunc (fn []
                              (pcall format-range)
                              (set vim.g.__operatorfunc nil)))
  (set vim.o.operatorfunc :v:lua.__operatorfunc))

(fn setup [opts]
  (let [clojure (require :lsp.clojure)
        fennel (require :lsp.fennel)
        go (require :lsp.go)
        ts (require :lsp.ts)]
    (clojure.setup opts)
    (fennel.setup opts)
    (go.setup opts)
    (ts.setup opts)))

{: format-move
 : setup}
