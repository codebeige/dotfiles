(local clojure (require :lsp.clojure))
(local fennel (require :lsp.fennel))
(local go (require :lsp.go))
(local ts (require :lsp.ts))

(fn setup []
  (clojure.setup)
  (fennel.setup)
  (go.setup)
  (ts.setup))

{: setup}
