(local s (require :lib.snippet))

(local defsnippet (partial s.defsnippet :all))

(defsnippet "lipsum"
  (s.t "Lorem ipsum dolor sic amet"))
