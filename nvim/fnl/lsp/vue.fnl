(local name :vls)

(fn tsdk-dir [root-dir]
  (case (vim.fs.root root-dir ["node_modules"])
    root (let [tsdk (vim.fs.joinpath root "node_modules" "typescript" "lib")]
          (if (vim.uv.fs_stat tsdk) tsdk))))

(fn before-init [init-params {:root_dir root-dir}]
  (case (vim.fs.root root-dir ["node_modules"])
    root (case (tsdk-dir root)
           tsdk (set init-params.initializationOptions
                     {:typescript {: tsdk}}))))

(local config
  {:cmd ["vue-language-server" "--stdio"]
   :filetypes [:vue]
   :root_markers ["package.json"]
   :before_init before-init})

{: name
 : config}
