(local {: autoload} (require :nfnl.module))
(local lib (autoload :lib.core))
(local luasnip (autoload :luasnip))
(local nfnl (autoload :nfnl.core))

(fn defsnippet [scope ...]
  (let [s (luasnip.snippet ...)]
    (nfnl.update-in luasnip [:snippets scope] #(lib.conj $ s))))

(local t luasnip.text_node)

{: defsnippet
 : t}
