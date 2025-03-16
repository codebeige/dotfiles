(local highlight (require :config.init.highlight))
(local diagnostic (require :config.init.diagnostic))
(local terminal (require :config.init.terminal))
(local clojure (require :config.init.clojure))
(local fennel (require :config.init.fennel))

(var loaded? false) ; TODO: remove?

(fn setup []
  (when (not loaded?)
    (highlight.setup)
    (diagnostic.setup)
    (terminal.setup)
    (clojure.setup)
    (fennel.setup)
    (set loaded? true)))

{: setup}
