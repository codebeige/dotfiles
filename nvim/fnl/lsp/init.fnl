(local clojure (require :lsp.clojure))
(local fennel (require :lsp.fennel))
(local go (require :lsp.go))
(local shared (require :lsp.shared))
(local typescript (require :lsp.typescript))
(local vue (require :lsp.vue))

(fn enable [{: name : config}]
  (set (. vim.lsp.config name) config)
  (case (vim.fn.executable (. config.cmd 1))
    1 (vim.lsp.enable name)))

(fn setup []
  (shared.setup)
  (enable clojure)
  (enable fennel)
  (enable go)
  (enable typescript)
  (enable vue))

{: setup}
