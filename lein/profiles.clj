{:user {:dependencies
        [[com.cemerick/piggieback "0.2.1"]
         [org.clojure/tools.nrepl "0.2.10"]]

        :plugins
        [[cider/cider-nrepl "0.9.1"]
         [refactor-nrepl "1.1.0"]]

        :repl-options
        {:nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}}}
