(module plugins.cmp
  {autoload {cmp cmp
             nvim aniseed.nvim}})

(def- mapping {})

(cmp.setup {:mapping mapping
            :sources [{:name "nvim_lsp"}
                      {:name "conjure"}
                      {:name "buffer" :keyword_length 5}
                      {:name "path"}]})
