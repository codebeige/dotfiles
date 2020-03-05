let g:projectionist_heuristics = {
      \ "deps.edn|project.clj|build.boot": {
      \   "src/*.clj": {
      \     "type": "source",
      \     "alternate": "test/{}_test.clj",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "src/*.cljs": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljs",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "src/*.cljc": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljc",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \ },
      \ "shadow-cljs.edn": {
      \   "src/*.cljs": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljs",
      \     "template": "(ns {dot|hyphenate})"
      \   }
      \ }}
