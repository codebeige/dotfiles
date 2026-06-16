(local astro (require :lsp.astro))
(local basedpyright (require :lsp.basedpyright))
(local clojure (require :lsp.clojure))
(local css (require :lsp.css))
(local fennel (require :lsp.fennel))
(local gopls (require :lsp.gopls))
(local html (require :lsp.html))
(local ruff (require :lsp.ruff))
(local shared (require :lsp.shared))
(local sourcekit (require :lsp.sourcekit))
(local typescript (require :lsp.typescript))

(fn enable [{: name : config}]
  (set (. vim.lsp.config name) config)
  (case (vim.fn.executable (. config.cmd 1))
    1 (vim.lsp.enable name)))

(fn setup []
  (shared.setup)
  (enable astro)
  (enable basedpyright)
  (enable clojure)
  (enable css)
  (enable fennel)
  (enable gopls)
  (enable html)
  (enable ruff)
  (enable sourcekit)
  (enable typescript))

{: setup}
