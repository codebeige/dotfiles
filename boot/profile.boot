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

(deftask lint-env
  "Set up environment for linting."
  []
  (set-env! :dependencies #(conj % '[tolitius/boot-check "RELEASE"]))
  (require '[tolitius.boot-check :as check])
  identity)

(deftask lint
  "Perform static analysis checks on source code. All available linters will
  run in succession unless specified otherwise.

  Available linters: yagni, eastwood, kibit, bikeshed"
  [c check-with NAME #{str} "Set of applied linters."]
  (apply comp
         (lint-env)
         (map #((->> % (str "with-") (symbol "tolitius.boot-check") resolve))
              (or (seq check-with) #{"yagni" "eastwood" "kibit" "bikeshed"}))))
