let g:clojure_align_subforms = 1
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '-as$', '^Before', '^After', '^Given', '^When', '^Then', '^And']
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,defui,define-component'

let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "deftest", "defcard", "defui", "Before","After","Given","When","Then","And"]
    \ }

let b:commentary_format=';; %s'
