(module plugins.cmp
  {autoload {cmp cmp
             nvim aniseed.nvim}})

(def- mapping
  {:<C-Space> (cmp.mapping.complete)
   :<C-n> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert})
   :<C-p> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert})
   :<C-j> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Select})
   :<C-k> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Select})
   :<C-y> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert :select true})
   :<C-e> (cmp.mapping {:i (cmp.mapping.abort) :c (cmp.mapping.close)})
   :<C-f> (cmp.mapping.scroll_docs 4)
   :<C-d> (cmp.mapping.scroll_docs -4)})

(cmp.setup {:experimental {:ghost_text true}
            :mapping mapping
            :sources [{:name "conjure"}
                      {:name "nvim_lsp"}
                      {:name "buffer"}
                      {:name "path"}]})
