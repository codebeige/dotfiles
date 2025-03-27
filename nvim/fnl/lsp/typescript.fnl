(local name :ts-ls)

(fn get-vue-plugin []
  (case (-> ["npm" "ls" "--global" "--parseable" "@vue/typescript-plugin"]
            (vim.system {:text true})
            (: :wait))
    {:code 0 : stdout} (case (vim.trim stdout)
                         "" nil
                         plugin-path plugin-path)))

(local init-options
  (vim.tbl_extend :error
                  {:hostInfo "neovim"}
                  (case (get-vue-plugin)
                    location {:plugins
                              [{:name "@vue/typescript-plugin"
                                : location
                                :languages [:javascript :typescript :vue]}]})))

(local config
  {:cmd ["typescript-language-server" "--stdio"]
   :filetypes [:javascript :javascriptreact :typescript :typescriptreact :vue]
   :root_markers ["tsconfig.json" "jsconfig.json" "package.json" ".git"]
   :init_options init-options})

{: name
 : config}
