let g:projectionist_heuristics = {
      \ "README.md": {
      \   "type": "doc"
      \ },
      \ "project.clj|build.boot": {
      \   "src/*.clj": {
      \     "type": "source",
      \     "alternate": "test/{}_test.clj",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "test/*_test.clj": {
      \     "type": "test",
      \     "alternate": "src/{}.clj",
      \     "template": [
      \       "(ns {dot|hyphenate}-test",
      \       "  (:require [clojure.test :refer :all]]",
      \       "            [{dot|hyphenate} :as {basename|hyphenate}]))"
      \     ]
      \   },
      \   "src/*.cljs": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljs",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "test/*_test.cljs": {
      \     "type": "test",
      \     "alternate": "src/{}.cljs",
      \     "template": [
      \       "(ns {dot|hyphenate}-test",
      \       "  (:require [cljs.test :refer-macros [deftest testing is]]",
      \       "            [{dot|hyphenate} :as {basename|hyphenate}]))"
      \     ]
      \   }
      \ }}
