(ns hooks.libpython-clj2.python
  (:require [clj-kondo.hooks-api :as api]))

#_{:clojure-lsp/ignore [:clojure-lsp/unused-public-var]}
(defn from-import [{:keys [node]}]
  {:node (api/list-node
          (into [(api/token-node 'declare)]
                (nthrest (:children node) 2)))})
