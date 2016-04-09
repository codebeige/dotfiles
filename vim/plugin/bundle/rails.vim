let g:rails_projections = {
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
  \ }}
