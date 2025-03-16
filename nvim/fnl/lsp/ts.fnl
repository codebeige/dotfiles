(local {:ts_ls ts-ls} (require :lspconfig))
(local shared (require :lsp.shared))

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
          0 {:on_attach shared.on-attach}
          1 {:on_attach shared.on-attach
             :init_options
             {:plugins
              [{:name "@vue/typescript-plugin"
                :location (get-vue-language-server-location)
                : languages}]}
             :filetypes languages}))))

{: setup}
