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
      \   "src/clj/*.clj": {
      \     "type": "source",
      \     "alternate": "test/clj/{}_test.clj",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "src/*.cljs": {
      \     "type": "source",
      \     "alternate": "test/{}_test.cljs",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "src/cljs/*.cljs": {
      \     "type": "source",
      \     "alternate": "test/cljs/{}_test.cljs",
      \     "template": "(ns {dot|hyphenate})"
      \   },
      \   "test/*_test.clj": {
      \     "type": "test",
      \     "alternate": "src/{}.clj",
      \     "template": [
      \       "(ns {dot|hyphenate}-test",
      \       "  (:require [clojure.test :refer [deftest testing is]]",
      \       "            [{dot|hyphenate} :as {basename|hyphenate}]))"
      \     ]
      \   },
      \   "test/clj/*_test.clj": {
      \     "type": "test",
      \     "alternate": "src/clj/{}.clj",
      \     "template": [
      \       "(ns {dot|hyphenate}-test",
      \       "  (:require [clojure.test :refer [deftest testing is]]",
      \       "            [{dot|hyphenate} :as {basename|hyphenate}]))"
      \     ]
      \   },
      \   "test/*_test.cljs": {
      \     "type": "test",
      \     "alternate": "src/{}.cljs",
      \     "template": [
      \       "(ns {dot|hyphenate}-test",
      \       "  (:require [cljs.test :refer-macros [deftest testing is]]",
      \       "            [{dot|hyphenate} :as {basename|hyphenate}]))"
      \     ]
      \   },
      \   "lib/*.clj": {
      \     "type": "source",
      \     "template": "(ns {dot|hyphenate})"
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
      \ },
      \ "spec/spec_helper.rb": {
      \   "lib/*.rb": {
      \     "type": "source",
      \     "alternate": "spec/{}_spec.rb"
      \   },
      \   "app/*.rb": {
      \     "type": "source",
      \     "alternate": "spec/{}_spec.rb"
      \   },
      \   "spec/*_spec.rb": {
      \     "type": "spec",
      \     "dispatch": "rspec spec/{}_spec.rb",
      \     "alternate": [
      \       "app/{}.rb",
      \       "lib/{}.rb",
      \     ],
      \     "template": [
      \       "require 'spec_helper'",
      \       "",
      \       "describe {camelcase|colons} do",
      \       "  it 'does something'",
      \       "end"
      \     ]
      \   }
      \ },
      \ "spec/features/&spec/rails_helper.rb": {
      \   "spec/features/*_spec.rb": {
      \     "type": "feature",
      \     "dispatch": "rspec spec/features/{}_spec.rb",
      \     "template": [
      \       "require 'rails_helper'",
      \       "",
      \       "feature '{capitalize|blank}' do",
      \       "  #TODO: add scenarios",
      \       "end",
      \     ],
      \   },
      \   "spec/models/*_spec.rb": {
      \     "related": "spec/rails_helper.rb",
      \     "template": [
      \       "require 'rails_helper'",
      \       "",
      \       "describe {camelcase|capitalize|colons} do",
      \       "  #TODO: add examples",
      \       "end",
      \     ]
      \   },
      \   "spec/controllers/*_spec.rb": {
      \     "related": "spec/rails_helper.rb",
      \     "template": [
      \       "require 'rails_helper'",
      \       "",
      \       "describe {camelcase|capitalize|colons} do",
      \       "  #TODO: add examples",
      \       "end",
      \     ]
      \   },
      \   "spec/views/*_spec.rb": {
      \     "related": "spec/rails_helper.rb",
      \     "template": [
      \       "require 'rails_helper'",
      \       "",
      \       "describe '{}' do",
      \       "  #TODO: add examples",
      \       "end",
      \     ]
      \   },
      \   "spec/routing/*_spec.rb": {
      \     "alternate": "config/routes.rb",
      \     "dispatch": "rspec spec/routing/{}_spec.rb",
      \     "template": [
      \       "require 'rails_helper'",
      \       "",
      \       "describe '{capitalize|blank}' do",
      \       "  #TODO: add routing specs",
      \       "end",
      \     ],
      \   }
      \ }}
