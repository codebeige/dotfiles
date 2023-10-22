(local {: autoload} (require :nfnl.module))
(local {: fennel_ls : util} (autoload :lspconfig))

(local dirs ["" :fnl/ :src/ :src/fnl/ :test/ :test/fnl/])

(local fennel-path (-> (icollect [_ d (ipairs dirs)]
                         (.. "./" d "?.fnl;./" d "?/init.fnl"))
                       (vim.fn.join ";")))

(local macro-path (-> (icollect [_ d (ipairs dirs)]
                        (.. "./" d "?.fnl;./" d "?/init-macros.fnl"))
                      (vim.fn.join ";")))

(fn setup [opts]
  (if (= 1 (vim.fn.executable :fennel-ls))
    (fennel_ls.setup
      (vim.tbl_deep_extend
        :force
        opts
        {:settings
         {:fennel-ls
          {:fennel-path (or (os.getenv :FENNEL_PATH) fennel-path)
           :macro-path (or (os.getenv :FENNEL_MACRO_PATH) macro-path)}}}))
    (print "LSP: fennel-ls not found")))

{: setup}
