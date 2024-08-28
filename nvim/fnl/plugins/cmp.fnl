(local labels {:buffer   "b"
               :cmdline  "q"
               :conjure  "c"
               :snippy   "s"
               :nvim_lsp "l"
               :path     "p"})

(fn menu-label [entry]
  (or (. labels (. entry :source :name)) "?"))

(fn format [entry item]
  (doto item
    (tset :menu (string.format "[%s]" (menu-label entry)))
    (tset :kind (string.lower (. item :kind)))))

(fn toggle-cmp [_]
  (let [cmp (require :cmp)]
    (if (cmp.visible) (cmp.close) (cmp.complete))))

(fn completable? []
  (-> (vim.api.nvim_get_current_line)
      (string.sub 1 (. (vim.api.nvim_win_get_cursor 0) 2))
      (string.match "[^%s]$")))

(fn smart-next [f]
  (let [cmp (require :cmp)
        snippy (require :snippy)]
    (if (cmp.visible)
      (cmp.select_next_item)

      (snippy.can_expand_or_advance)
      (snippy.expand_or_advance)

      (completable?)
      (cmp.complete)

      (f))))

(fn smart-prev [f]
  (let [cmp (require :cmp)
        snippy (require :snippy)]
    (if (cmp.visible)
      (cmp.select_prev_item)

      (snippy.can_jump -1)
      (snippy.previous)

      (f))))

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
                :mapping {:<C-Space> (cmp.mapping toggle-cmp [:i :c])
                          :<C-N>     (cmp.mapping (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
                          :<C-P>     (cmp.mapping (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert}) [:i :c])
                          :<CR>      (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select false}) [:i :c])
                          :<C-Y>     (cmp.mapping (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select true}) [:i :c])
                          :<C-E>     (cmp.mapping (cmp.mapping.abort) [:i :c])
                          :<C-D>     (cmp.mapping (cmp.mapping.scroll_docs 5) [:i :c])
                          :<C-U>     (cmp.mapping (cmp.mapping.scroll_docs -5)  [:i :c])
                          :<Tab>     (cmp.mapping smart-next [:i :s])
                          :<S-Tab>   (cmp.mapping smart-prev [:i :s])}
                :snippet {:expand (fn [{: body}] (snippy.expand_snippet body))}
                :sources [{:name "snippy"}
                          {:name "buffer"}
                          {:name "nvim_lsp"}
                          {:name "conjure"}
                          {:name "path"}]})

    (cmp.setup.cmdline :/ {:sources [{:name "buffer"}]})

    (cmp.setup.cmdline :: {:sources [{:name "cmdline"}
                                     {:name "path"}]})

    (let [g (vim.api.nvim_create_augroup :config_cmp {:clear true})]
      (vim.api.nvim_create_autocmd :ColorScheme {:callback update-colorscheme
                                                 :group g
                                                 :pattern "*"}))
    (update-colorscheme)))

{: config}
