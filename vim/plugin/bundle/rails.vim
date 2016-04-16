let g:rails_projections = {
  \ "spec/models/*_spec.rb": {
  \   "related": "spec/rails_helper.rb",
  \   "template": [
  \     "require 'rails_helper'",
  \     "",
  \     "describe {camelcase|capitalize|colons} do",
  \     "  #TODO: add examples",
  \     "end",
  \   ]
  \ },
  \ "spec/controllers/*_spec.rb": {
  \   "related": "spec/rails_helper.rb",
  \   "template": [
  \     "require 'rails_helper'",
  \     "",
  \     "describe {camelcase|capitalize|colons} do",
  \     "  #TODO: add examples",
  \     "end",
  \   ]
  \ },
  \ "spec/features/*_spec.rb": {
  \   "related": ["spec/support/env.rb", "spec/rails_helper.rb"],
  \   "task": "spec:features",
  \   "keywords": "with_scope fill_in find",
  \   "command": "feature",
  \   "template": [
  \     "require 'rails_helper'",
  \     "",
  \     "feature '{capitalize|blank}' do",
  \     "  #TODO: add scenarios",
  \     "end",
  \   ]
  \ },
  \ "spec/routing/*_spec.rb": {
  \   "alternate": "config/routes.rb",
  \   "related": "spec/rails_helper.rb",
  \   "template": [
  \     "require 'rails_helper'",
  \     "",
  \     "describe '{capitalize|blank}' do",
  \     "  #TODO: add routing specs",
  \     "end",
  \   ]
  \ }}
