(local {:ts_ls ts-ls} (require :lspconfig))

(fn get-vue-language-server-location []
  (case (-> ["npm" "ls" "--global" "--parseable" "@vue/language-server"]
            (vim.system {:text true})
            (: :wait))
    {:code 0 : stdout} (case (vim.trim stdout)
                         "" nil
                         location location)))

(local languages [:javascript :typescript :vue])

(fn setup [_]
  (case (vim.fn.executable :typescript-language-server)
    1 (ts-ls.setup
        (case (vim.fn.executable :vue-language-server)
          0 {}
          1 {:init_options
             {:plugins
              [{:name "@vue/typescript-plugin"
                :location (get-vue-language-server-location)
                : languages}]}
             :filetypes languages}))))

{: setup}
