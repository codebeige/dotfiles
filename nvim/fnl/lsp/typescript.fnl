(local name :ts-ls)

(fn has-package? [root-dir name]
  (case (-> ["npm" "ls" "--parseable" name]
            (vim.system {:cwd root-dir :text true})
            (: :wait))
    {:code 0 : stdout} (< 0 (length (vim.trim stdout)))))

(var server-location* nil)

(fn server-location []
  (or server-location*
      (when (vim.fn.executable :brew)
        (case-try (-> ["brew" "--prefix" "vue-language-server"]
                      (vim.system {:text true})
                      (: :wait))
                  {:code 0 : stdout} (vim.fs.find
                                       (fn [name path]
                                         (and (= name "language-server")
                                              (path:match "@vue$")))
                                       {:path (vim.trim stdout)
                                        :type :directory})
                  [path] (doto server-location* (set path))))))

(fn before-init [init-params {:root_dir root-dir}]
  (when (has-package? root-dir :vue)
    (case (server-location)
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

(var global-tsdk-dir* nil)

(fn tsdk-dir [root]
  (case (vim.fs.find (fn [name path]
                       (and (= name "lib") (path:match "typescript$")))
                     {:path root :type :directory})
    [path] path))

(fn global-tsdk-dir []
  (or global-tsdk-dir*
      (when (vim.fn.executable :brew)
        (case-try (-> ["brew" "--prefix" "typescript"]
                      (vim.system {:text true})
                      (: :wait))
                  {:code 0 : stdout} (tsdk-dir (vim.trim stdout))
                  path (doto global-tsdk-dir* (set path))))))

(fn local-tsdk-dir [root-dir]
  (case (vim.fs.root root-dir ["node_modules"])
    root (tsdk-dir root)))

(fn tsdk-dir [root-dir]
  (or (local-tsdk-dir root-dir) (global-tsdk-dir)))

{: name
 : config
 : tsdk-dir}
