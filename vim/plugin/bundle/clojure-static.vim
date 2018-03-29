let g:clojure_align_subforms = 1
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '-as$', 'def$']
let g:clojure_fuzzy_indent_blacklist =
      \ ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
let g:clojure_special_indent_words =
      \ 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'

let g:clojure_syntax_keywords = {
      \ 'clojureMacro': ['deftest', 'defstyles', 'defsketch']
      \ }

augroup clojure-static
  autocmd!

  autocmd BufNewFile,BufReadPre project.clj
        \ let b:clojure_syntax_keywords = {
        \   'clojureMacro': ['defproject']
        \ }

  autocmd BufNewFile,BufReadPre build.boot
        \ let b:clojure_syntax_keywords = {
        \   'clojureMacro': ['deftask', 'set-env!', 'task-options!']
        \ }

  autocmd BufNewFile,BufReadPre *.cljs
        \ let b:clojure_syntax_keywords = {
        \   'clojureMacro': ['defui', 'defcard']
        \ }

  autocmd BufNewFile,BufReadPre */step_definitions/*.clj
        \ let b:clojure_syntax_keywords = {
        \   'clojureMacro':
        \     ['Given', 'When', 'Then', 'And', 'But', 'Before', 'After']
        \ }
  autocmd BufNewFile,BufRead */step_definitions/*.clj
        \ setlocal lispwords+=Given,When,Then,And,But,Before,After

  " reload syntax on new files as events are triggered too late
  autocmd BufNewFile *
        \ if exists('b:clojure_syntax_keywords') | syntax on | endif
augroup END
