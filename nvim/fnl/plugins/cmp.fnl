(local labels {:buffer   "b"
               :cmdline  "q"
               :snippy   "s"
               :nvim_lsp "l"
               :path     "p"})

(fn menu-label [entry]
  (or (. labels (. entry :source :name)) "?"))

(fn format [entry item]
  (doto item
    (tset :menu (string.format "[%s]" (menu-label entry)))
    (tset :kind (string.lower (. item :kind)))))

(fn exit [cmp]
  (fn [fallback]
    (when (cmp.visible) (cmp.abort))
    (fallback)))

(fn update-colorscheme []
  (vim.api.nvim_set_hl 0 :CmpItemAbbr {:link :Pmenu})
  (vim.api.nvim_set_hl 0 :CmpItemAbbrDeprecated {:link :Pmenu})
  (vim.api.nvim_set_hl 0 :CmpItemAbbrMatch {:link :Pmenu})
  (vim.api.nvim_set_hl 0 :CmpItemAbbrMatchFuzzy {:link :Pmenu})
  (vim.api.nvim_set_hl 0 :CmpItemKind {:link :Comment})
  (vim.api.nvim_set_hl 0 :CmpItemMenu {:link :NonText}))

(fn config []
  (let [cmp (require :cmp)
        snippy (require :snippy)]
    (cmp.setup {:experimental {:ghost_text true}
                :formatting {:fields [:abbr :kind :menu]
                             :format format}
                :mapping {:<Tab> (cmp.mapping (cmp.mapping.confirm {:select true}) [:i :s])
                          :<C-N> (cmp.mapping (cmp.mapping.select_next_item) [:i :c])
                          :<C-P> (cmp.mapping (cmp.mapping.select_prev_item) [:i :c])
                          :<CR>  (cmp.mapping (cmp.mapping.confirm {:select false}) [:i :c])
                          :<C-D> (cmp.mapping (cmp.mapping.scroll_docs 5) [:i :c])
                          :<C-U> (cmp.mapping (cmp.mapping.scroll_docs -5) [:i :c])
                          :<C-E> (cmp.mapping (cmp.mapping.abort) [:i :c])
                          :<Esc> (cmp.mapping (exit cmp) [:i :c])
                          :<C-L> (cmp.mapping (exit cmp) [:i :c])}
                :snippet {:expand (fn [{: body}] (snippy.expand_snippet body))}
                :sources [{:name "nvim_lsp"}
                          {:name "snippy"}
                          {:name "buffer"}
                          {:name "path"}]})

    (cmp.setup.cmdline :/ {:sources [{:name "buffer"}]})

    (cmp.setup.cmdline :: {:sources [{:name "cmdline"}
                                     {:name "path"}]})

    (let [group (vim.api.nvim_create_augroup :config.cmp {:clear true})]
      (vim.api.nvim_create_autocmd :ColorScheme
                                   {:callback (fn [_]
                                                (update-colorscheme)
                                                nil)
                                    : group}))
    (update-colorscheme)))

{: config}
