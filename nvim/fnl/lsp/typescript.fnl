(local name :ts-ls)

(fn find-package [name root-dir]
  (case (-> ["npm" "ls" (if (not root-dir) "--global") "--parseable" name]
            (vim.system {:text true :cwd root-dir})
            (: :wait))
    {:code 0 : stdout} (case (vim.trim stdout)
                         "" nil
                         path path)))

(fn before-init [init-params {:root_dir root-dir}]
  (when (find-package "vue" root-dir)
    (case (find-package "@vue/typescript-plugin")
      location (set init-params.initializationOptions.plugins
                    [{:name "@vue/typescript-plugin"
                      : location
                      :languages [:javascript :typescript :vue]}]))))

(local config
  {:cmd ["typescript-language-server" "--stdio"]
   :filetypes [:javascript :javascriptreact :typescript :typescriptreact :vue]
   :root_markers ["tsconfig.json" "jsconfig.json" "package.json" ".git"]
   :init_options {:hostInfo "neovim"}
   :before_init before-init})

{: name
 : config}
