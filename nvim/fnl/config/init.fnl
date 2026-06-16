(local highlight (require :config.highlight))
(local diagnostic (require :config.diagnostic))
(local terminal (require :config.terminal))
(local clojure (require :config.clojure))
(local fennel (require :config.fennel))
(local golang (require :config.golang))
(local lsp (require :lsp))

(fn setup []
  (highlight.setup)
  (diagnostic.setup)
  (terminal.setup)
  (clojure.setup)
  (fennel.setup)
  (golang.setup)
  (lsp.setup))

{: setup}
