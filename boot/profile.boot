(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       conj '[cider/cider-nrepl "0.9.1"]
            '[refactor-nrepl "1.1.0-SNAPSHOT"])

(swap! boot.repl/*default-middleware*
       conj 'cider.nrepl/cider-middleware
            'refactor-nrepl.middleware/wrap-refactor)
