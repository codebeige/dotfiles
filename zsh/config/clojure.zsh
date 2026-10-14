clj() {
  if (( $# == 0 )); then
    clojure -M:repl/clj
  else
    clojure "$@"
  fi
}

cljs() {
  rlwrap clojure -M:repl/cljs "$@"
}
