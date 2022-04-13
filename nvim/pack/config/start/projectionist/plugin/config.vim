let g:projectionist_heuristics = {
      \ "deps.edn|project.clj|build.boot": {
      \   "src/*.clj": {
      \     "type": "source",
      \     "alternate": "test/{}_test.clj"
      \   },
      \   "src/*.cljs": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljs"
      \   },
      \   "src/*.cljc": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljc"
      \   },
      \ },
      \ "shadow-cljs.edn": {
      \   "src/*.cljs": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljs"
      \   },
      \   "test/*_test.cljs": {
      \     "type": "test",
      \     "alternate": "src/{}.cljs"
      \   }
      \ }}
