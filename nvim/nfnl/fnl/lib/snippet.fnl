(local {: autoload} (require :nfnl.module))
(local lib (autoload :lib.core))
(local luasnip (autoload :luasnip))

(fn defsnippet [scope ...]
  (let [s (luasnip.snippet ...)]
    (a.update-in luasnip [:snippets scope] #(lib.conj $ s))))

(local t luasnip.text_node)

{: defsnippet
 : t}
