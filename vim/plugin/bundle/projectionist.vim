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
      \   "lib/*.clj": {
      \     "type": "library",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "test/*_test.clj": {
      \     "type": "test",
      \     "alternate": "src/{}.clj",
      \     "template": [
      \       "(ns {dot|hyphenate}-test",
      \       "  (:require [clojure.test :refer :all]",
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
      \ },
      \ "config/site.yml": {
      \   "app/views/pages/*.liquid.haml": {
      \     "type": "template",
      \     "template": [
      \       "---",
      \       "title: {basename|blank|capitalize}",
      \       "handle: {basename|hyphenate}",
      \       "published: true",
      \       "listed: true",
      \       "position: 1",
      \       "---",
      \       "{open}% extends parent %{close}"
      \     ]
      \   },
      \   "app/content_types/*.yml": {
      \     "type": "content",
      \     "alternate": "data/{}.yml",
      \     "template": [
      \       "name: {basename|blank|capitalize}",
      \       "slug: {basename|hyphenate}",
      \       "description: # TODO: provide description",
      \       "label_field_name: name",
      \       "order_by: manually",
      \       "order_direction: asc",
      \       "",
      \       "fields:",
      \       "",
      \       "- name:",
      \       "    label: Name",
      \       "    type: string",
      \       "    required: true"
      \     ]
      \   },
      \   "data/*.yml": {
      \     "type": "data",
      \     "alternate": "app/content_types/{}.yml",
      \     "template": [
      \       "- \"{basename|singular|blank|capitalize} 1\":",
      \       "    property: Foo # TODO edit fields",
      \       "- \"{basename|singular|blank|capitalize} 2\":",
      \       "    property: Bar # TODO edit fields",
      \       "- \"{basename|singular|blank|capitalize} 3\":",
      \       "    property: Baz # TODO edit fields"
      \     ]
      \   }
      \ }}
