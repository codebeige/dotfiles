(local name :astro)
(local {: tsdk-dir} (require :lsp.typescript))

(fn before-init [init-params {:root_dir root-dir}]
  (case (vim.fs.root root-dir ["node_modules"])
    root (case (tsdk-dir root)
           tsdk (set init-params.initializationOptions
                     {:typescript {: tsdk}}))))

(local config
  {:cmd ["astro-ls" "--stdio"]
   :filetypes [:astro]
   :root_markers ["package.json" "tsconfig.json" "jsconfig.json" ".git"]
   :before_init before-init})

{: config
 : name}
