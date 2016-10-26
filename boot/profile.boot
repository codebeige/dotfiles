(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.14.0"]
                [refactor-nrepl "2.2.0"]])

(swap! boot.repl/*default-middleware*
       conj 'cider.nrepl/cider-middleware
            'refactor-nrepl.middleware/wrap-refactor)
