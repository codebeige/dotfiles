let g:clojure_align_subforms = 1
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns =
      \ ['^with', '^def', '^let', '-as$', 'def$', '^reg-', '-loop$','^for-']
let g:clojure_fuzzy_indent_blacklist =
      \ ['-fn$', '\v^with-%(meta|loading-context)$']
let g:clojure_special_indent_words =
      \ 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'

let g:clojure_syntax_keywords = {
      \ 'clojureMacro': ['deftest', 'defstyles', 'defsketch']
      \ }
