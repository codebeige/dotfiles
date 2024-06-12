(local {: autoload} (require :nfnl.module))
(local scratch (autoload :codebeige.scratch))
(local highlight (autoload :config.highlight))

(require :config.diagnostic)
(require :config.terminal)
(require :config.clojure)
(require :config.fennel)

(var loaded? false)

(fn init []
  (when (not loaded?)
    (scratch.init)
    (highlight.init))
  true)

(set loaded? (init))

{: init}
