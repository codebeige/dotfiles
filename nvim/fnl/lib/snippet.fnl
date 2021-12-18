(module lib.snippet
  {autoload {a aniseed.core
             lib lib.core
             luasnip luasnip}})

(defn defsnippet [scope ...]
  (let [s (luasnip.snippet ...)]
    (a.update-in luasnip [:snippets scope] #(lib.conj $ s))))

(def t luasnip.text_node)
