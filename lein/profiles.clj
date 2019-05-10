{:user {:dependencies
        [[cider/piggieback "0.4.0"]
         [com.cemerick/piggieback "0.2.1"]]

        :plugins
        [[cider/cider-nrepl "0.21.1"]]

        :repl-options
        {:nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}}
