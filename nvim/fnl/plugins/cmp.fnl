(module plugins.cmp
  {autoload {cmp cmp
             core aniseed.core
             luasnip luasnip
             nvim aniseed.nvim
             util lib.util}
   require-macros [lib.macros]})

(def- labels {:buffer   "b"
              :cmdline  "q"
              :conjure  "c"
              :nvim_lsp "l"
              :path     "p"})

(defn- menu-label [entry]
  (core.get labels (core.get-in entry [:source :name]) "?"))

(defn- format [entry item]
  (-> item
      (core.assoc :menu (string.format "[%s]" (menu-label entry)))
      (core.update :kind string.lower)))

(defn toggle-cmp [_]
  (if (cmp.visible) (cmp.close) (cmp.complete)))

(def- mapping
  {:<C-Space> (cmp.mapping toggle-cmp [:i :c])
   :<C-N>     (cmp.mapping (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
   :<C-P>     (cmp.mapping (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
   :<CR>      (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select true}) [:i :c])
   :<C-Y>     (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select false}) [:i :c])
   :<C-E>     (cmp.mapping (cmp.mapping.abort) [:i :c])
   :<C-D>     (cmp.mapping (cmp.mapping.scroll_docs 5) [:i :c])
   :<C-U>     (cmp.mapping (cmp.mapping.scroll_docs -5)  [:i :c])
   :<Tab>     cmp.config.disable
   :<S-Tab>   cmp.config.disable})

(cmp.setup {:experimental {:ghost_text true}
            :formatting {:fields [:abbr :kind :menu]
                         :format format}
            :mapping mapping
            :snippet {:expand (fn [{: body}] (luasnip.lsp_expand body))}
            :sources [{:name "nvim_lsp"}
                      {:name "luasnip"}
                      {:name "conjure"}
                      {:name "buffer"}
                      {:name "path"}]})

(defn update-colorscheme []
  (nvim.ex.highlight :link :CmpItemMenu :SpecialChar))

(update-colorscheme)

(augroup :config_lspconfig
  (autocmd :ColorScheme "*" update-colorscheme))
