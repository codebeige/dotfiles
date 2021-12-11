(module lib.lsp
  {autoload {nvim aniseed.nvim}
   require-macros [lib.macros]})

(defn- format-range []
  (with-restore-view
    (vim.lsp.buf.range_formatting
      {}
      (nvim.buf_get_mark 0 "[")
      (nvim.buf_get_mark 0 "]"))))

(defn format-move []
  (set-operatorfunc format-range))
