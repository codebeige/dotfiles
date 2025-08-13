(local basedpyright (require :lsp.basedpyright))
(local clojure (require :lsp.clojure))
(local fennel (require :lsp.fennel))
(local go (require :lsp.go))
(local ruff (require :lsp.ruff))
(local shared (require :lsp.shared))
(local typescript (require :lsp.typescript))
(local vue (require :lsp.vue))

(fn enable [{: name : config}]
  (set (. vim.lsp.config name) config)
  (case (vim.fn.executable (. config.cmd 1))
    1 (vim.lsp.enable name)))

(fn setup []
  (shared.setup)
  (enable basedpyright)
  (enable clojure)
  (enable fennel)
  (enable go)
  (enable ruff)
  (enable typescript)
  (enable vue))

{: setup}
