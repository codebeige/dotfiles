(local {: autoload} (require :nfnl.module))
(local scratch (autoload :codebeige.scratch))

(require :config.highlight)
(require :config.diagnostic)
(require :config.terminal)
(require :config.clojure)
(require :config.fennel)

(var loaded? false)

(fn init []
  (when (not loaded?)
    (scratch.init))
  true)

(set loaded? (init))

{: init}
