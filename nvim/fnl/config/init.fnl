(local highlight (require :config.highlight))
(local diagnostic (require :config.diagnostic))
(local terminal (require :config.terminal))
(local clojure (require :config.clojure))
(local fennel (require :config.fennel))
(local lsp (require :lsp))

(fn setup []
  (highlight.setup)
  (diagnostic.setup)
  (terminal.setup)
  (clojure.setup)
  (fennel.setup)
  (lsp.setup))

{: setup}
