(local clojure (require :lsp.clojure))
(local fennel (require :lsp.fennel))
(local go (require :lsp.go))
(local shared (require :lsp.shared))
(local typescript (require :lsp.typescript))

(fn setup []
  (shared.setup)
  (clojure.setup)
  (fennel.setup)
  (go.setup)
  (typescript.setup))

{: setup}
