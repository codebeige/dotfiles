(local name :ts-ls)

(fn has-package? [root-dir name]
  (case (-> ["npm" "ls" "--parseable" name]
            (vim.system {:cwd root-dir :text true})
            (: :wait))
    {:code 0 : stdout} (< 0 (length (vim.trim stdout)))))

(var plugin-dir* nil)

(fn plugin-dir []
  (or plugin-dir*
      (when (vim.fn.executable :brew)
        (case-try (-> ["brew" "--prefix" "vue-language-server"]
                      (vim.system {:text true})
                      (: :wait))
                  {:code 0 : stdout} (vim.fs.find "typescript-plugin"
                                                  {:path (vim.trim stdout)
                                                   :type :directory})
                  [path] (doto plugin-dir* (set path))))))

(fn before-init [init-params {:root_dir root-dir}]
  (when (has-package? root-dir :vue)
    (case (plugin-dir)
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
