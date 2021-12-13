(module plugins.cmp
  {autoload {cmp cmp
             nvim aniseed.nvim}})

(def- mapping {})

(cmp.setup {:mapping mapping
            :sources [{:name "buffer"}
                      {:name "conjure"}
                      {:name "nvim_lsp"}]})
