(deftask cider
  "Inject cider middleware."
  []
  (require 'boot.repl)
  (swap! @(resolve 'boot.repl/*default-dependencies*)
         concat '[[cider/cider-nrepl "RELEASE"]
                  [refactor-nrepl "RELEASE"]])
  (swap! @(resolve 'boot.repl/*default-middleware*)
         conj 'cider.nrepl/cider-middleware
              'refactor-nrepl.middleware/wrap-refactor)
  identity)

(deftask slamhound
  "Add Slamhound dependency."
  []
  (require 'boot.repl)
  (swap! @(resolve 'boot.repl/*default-dependencies*)
         concat '[[slamhound "RELEASE"]])
  identity)

(deftask dev-env
  "Inject development tools."
  []
  (comp (cider)
        (slamhound)))

(deftask dev-repl
  "Start REPL in development mode."
  []
  (comp (dev-env)
        (repl)))
