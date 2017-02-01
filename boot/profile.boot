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

(deftask dev-repl
  "Start REPL in development mode."
  []
  (comp (cider)
        (slamhound)
        (repl)))

(deftask lint
  "Perform static analysis checks on source code. All available linters will
  run in succession unless specified otherwise.

  Available linters: yagni, eastwood, kibit, bikeshed"
  [c check-with NAME #{str} "Set of applied linters."]
  (set-env! :dependencies
            #(conj % '[tolitius/boot-check "RELEASE" :scope "test"]))
  (require '[tolitius.boot-check :as check])
  (apply comp
         (map #((->> % (str "with-") (symbol "tolitius.boot-check") resolve))
              (or (seq check-with) #{"yagni" "eastwood" "kibit" "bikeshed"}))))
