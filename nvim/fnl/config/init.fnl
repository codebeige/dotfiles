(local {: autoload} (require :nfnl.module))
(local scratch (autoload :codebeige.scratch))
(local highlight (autoload :config.init.highlight))
(local diagnostic (autoload :config.init.diagnostic))
(local terminal (autoload :config.init.terminal))
(local clojure (autoload :config.init.clojure))
(local fennel (autoload :config.init.fennel))

(var loaded? false)

(fn setup []
  (when (not loaded?)
    (scratch.setup)
    (highlight.setup)
    (diagnostic.setup)
    (terminal.setup)
    (clojure.setup)
    (fennel.setup)
    (set loaded? true)))

{: setup}
