(module lib.lsp
  {autoload {a aniseed.core
             nvim aniseed.nvim}
   require-macros [lib.macros]})

(defn- format-range []
  (with-restore-view
    (vim.lsp.buf.range_formatting
      {}
      (nvim.buf_get_mark 0 "[")
      (nvim.buf_get_mark 0 "]"))))

(defn format-move []
  (set-operatorfunc format-range))

(defn cmd-args []
  (let [[line column] (nvim.win_get_cursor 0)]
    [(vim.uri_from_bufnr) (a.dec line) column]))
