(fn config []
  (set vim.g.projectionist_heuristics
       {"deps.edn|project.clj|build.boot"
        {"src/*.clj" {:type "source"
                      :alternate "test/{}_test.clj"}
         "src/*.cljs" {:type "source"
                       :alternate "test/{}_test.cljs"}
         "src/*.cljc" {:type "source"
                       :alternate "test/{}_test.cljc"}}
       "shadow-cljs.edn"
       {"src/*.cljs" {:type "source"
                      :alternate "test/{}_test.cljs"}
        "test/*_test.cljs" {:type "test"
                            :alternate "src/{}.cljs"}}
       ".nfnl.fnl"
       {"fnl/*.fnl" {:type "source"
                     :alternate "test/fnl/{}-test.fnl"
                     :related "lua/{}.lua"}
        "test/fnl/*-test.fnl" {:type "test"
                               :alternate "fnl/{}.fnl"
                               :related "test/lua/{}-test.lua"}
        "lua/*.lua" {:type "compiled"
                     :alternate "fnl/{}.fnl"}
        "test/lua/*-test.lua" {:type "compiled-test"
                               :alternate "test/fnl/{}-test.fnl"}}}))

{: config}
