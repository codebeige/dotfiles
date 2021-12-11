(module config.lspconfig
  {autoload {clojure lsp.clojure
             lsp lspconfig
             nvim aniseed.nvim}
   require-macros [lib.macros]})

(def- signs {:Error "!"
             :Warn  "*"
             :Info  "~"
             :Hint  "?"})

(each [s t (pairs signs)]
  (let [name (.. :DiagnosticSign s)]
    (vim.fn.sign_define name {:text (.. " " t) :texthl name :numhl name})))

(defn update-colorscheme []
  (nvim.ex.highlight :clear :DiagnosticError)
  (nvim.ex.highlight :link :DiagnosticError :ErrorMsg))

(augroup :config_lspconfig
  (autocmd :ColorScheme "*" update-colorscheme))

(lsp.clojure_lsp.setup {:on_attach clojure.on-attach})
