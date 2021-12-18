(module snippets.all
  {autoload {s lib.snippet}})

(def- defsnippet (partial s.defsnippet :all))

(defsnippet "lipsum"
  (s.t "Lorem ipsum dolor sic amet"))

(comment
  (luasnip.cleanup))
