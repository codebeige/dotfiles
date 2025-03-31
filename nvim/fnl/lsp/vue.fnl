(local name :vls)

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

(fn before-init [init-params {:root_dir root-dir}]
  (case (vim.fs.root root-dir ["node_modules"])
    root (case (or
                 vim.b.vue-language-server-tsdk
                 vim.g.vue-language-server-tsdk
                 (local-tsdk-dir root)
                 (global-tsdk-dir))
           tsdk (set init-params.initializationOptions
                     {:typescript {: tsdk}}))))

(local config
  {:cmd ["vue-language-server" "--stdio"]
   :filetypes [:vue]
   :root_markers ["package.json"]
   :before_init before-init})

{: name
 : config}
