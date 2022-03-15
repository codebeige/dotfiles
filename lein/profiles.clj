{:user {:dependencies
        [[cider/piggieback "0.5.3"]
         [com.cemerick/piggieback "0.2.1"]]

        :plugins
        [[cider/cider-nrepl "0.28.3"]]

        :repl-options
        {:nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}}
