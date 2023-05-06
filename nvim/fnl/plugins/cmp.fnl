(module plugins.cmp
  {autoload {a aniseed.core
             cmp cmp
             luasnip luasnip
             nvim aniseed.nvim}
   require-macros [lib.macros]})

(def- labels {:buffer   "b"
              :cmdline  "q"
              :conjure  "c"
              :luasnip  "s"
              :nvim_lsp "l"
              :path     "p"})

(defn- menu-label [entry]
  (a.get labels (a.get-in entry [:source :name]) "?"))

(defn- format [entry item]
  (-> item
      (a.assoc :menu (string.format "[%s]" (menu-label entry)))
      (a.update :kind string.lower)))

(defn toggle-cmp [_]
  (if (cmp.visible) (cmp.close) (cmp.complete)))

(defn- completable? []
  (-> (vim.api.nvim_get_current_line)
      (string.sub 1 (. (vim.api.nvim_win_get_cursor 0) 2))
      (string.match "[^%s]$")))

(defn smart-next [f]
  (if (cmp.visible)
      (cmp.select_next_item)

      (luasnip.expand_or_jumpable)
      (luasnip.expand_or_jump)

      (completable?)
      (cmp.complete)

      (f)))

(defn smart-prev [f]
  (if (cmp.visible)
      (cmp.select_prev_item)

      (luasnip.jumpable -1)
      (luasnip.jump -1)

      (f)))

(def- mapping
  {:<C-Space> (cmp.mapping toggle-cmp [:i :c])
   :<C-N>     (cmp.mapping (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
   :<C-P>     (cmp.mapping (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
   :<CR>      (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select false}) [:i :c])
   :<C-Y>     (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select true}) [:i :c])
   :<C-E>     (cmp.mapping (cmp.mapping.abort) [:i :c])
   :<C-D>     (cmp.mapping (cmp.mapping.scroll_docs 5) [:i :c])
   :<C-U>     (cmp.mapping (cmp.mapping.scroll_docs -5)  [:i :c])
   :<Tab>     (cmp.mapping smart-next [:i :s])
   :<S-Tab>   (cmp.mapping smart-prev [:i :s])})

(defn update-colorscheme []
  (nvim.ex.highlight! :link :CmpItemAbbr :Pmenu)
  (nvim.ex.highlight! :link :CmpItemAbbrDeprecated :Pmenu)
  (nvim.ex.highlight! :link :CmpItemAbbrMatch :Pmenu)
  (nvim.ex.highlight! :link :CmpItemAbbrMatchFuzzy :Pmenu)
  (nvim.ex.highlight! :link :CmpItemKind :Comment)
  (nvim.ex.highlight! :link :CmpItemMenu :NonText))

(defn config []
  (cmp.setup {:experimental {:ghost_text true}
              :formatting {:fields [:abbr :kind :menu]
                           :format format}
              :mapping mapping
              :snippet {:expand (fn [{: body}] (luasnip.lsp_expand body))}
              :sources [{:name "luasnip"}
                        {:name "buffer"}
                        {:name "nvim_lsp"}
                        {:name "conjure"}
                        {:name "path"}]})

  (cmp.setup.cmdline :/ {:sources [{:name "buffer"}]})

  (cmp.setup.cmdline :: {:sources [{:name "cmdline"}
                                   {:name "path"}]})

  (update-colorscheme)
  (augroup :config_cmp
    (autocmd :ColorScheme "*" update-colorscheme)))
