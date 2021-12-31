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

(def- mapping
  {:<C-Space> (cmp.mapping toggle-cmp [:i :c])
   :<C-N>     (cmp.mapping (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
   :<C-P>     (cmp.mapping (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
   :<CR>      (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select false}) [:i :c])
   :<C-Y>     (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select true}) [:i :c])
   :<C-E>     (cmp.mapping (cmp.mapping.abort) [:i :c])
   :<C-D>     (cmp.mapping (cmp.mapping.scroll_docs 5) [:i :c])
   :<C-U>     (cmp.mapping (cmp.mapping.scroll_docs -5)  [:i :c])
   :<Tab>     cmp.config.disable
   :<S-Tab>   cmp.config.disable})

(defn update-colorscheme []
  (nvim.ex.highlight :link :CmpItemMenu :SpecialChar))

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

  (augroup :config_cmp
    (autocmd :ColorScheme "*" update-colorscheme)))
