(local {: capabilities} (require :lsp.shared))

(local ts-init-options {:hostInfo "neovim"})

(local languages [:javascript
                  :javascriptreact
                  :typescript
                  :typescriptreact
                  :vue])

(fn on-ft-ts [{:buf buffer}]
  (vim.lsp.start
    {:name :typescript-language-server
     :cmd ["typescript-language-server" "--stdio"]
     :root_dir (vim.fs.root buffer ["tsconfig.json"
                                    "jsconfig.json"
                                    "package.json"
                                    ".git"])
     :init_options ts-init-options
     : capabilities}))

(local root-dir->tsdk {})

(fn get-tsdk [root-dir]
  (or (. root-dir->tsdk root-dir)
      (let [tsdk (case (vim.fs.root root-dir ["node_modules"])
                   dir (vim.fs.joinpath dir "node_modules" "typescript" "lib"))]
        (set (. root-dir->tsdk root-dir) tsdk)
        tsdk)))

(fn on-ft-vue [{:buf buffer}]
  (let [root-dir (vim.fs.root buffer ["package.json"])]
    (vim.lsp.start
      {:name :vue-language-server
       :cmd ["vue-language-server" "--stdio"]
       :root_dir root-dir
       :init_options {:typescript {:tsdk (get-tsdk root-dir)}}
       : capabilities})))

(fn get-vue-dir []
  (case (-> ["npm" "ls" "--global" "--parseable" "@vue/language-server"]
            (vim.system {:text true})
            (: :wait))
    {:code 0 : stdout} (vim.trim stdout)))

(fn setup []
  (case (vim.fn.executable :vue-language-server)
    1 (let [group (vim.api.nvim_create_augroup :lsp.vue {:clear true})]
        (vim.api.nvim_create_autocmd :FileType {:pattern [:vue]
                                                :callback (fn [e]
                                                            (on-ft-vue e)
                                                            nil)
                                                : group})
        (set ts-init-options.plugins [{:name "@vue/typescript-plugin"
                                       :location (get-vue-dir)
                                       : languages}])))

  (case (vim.fn.executable :typescript-language-server)
    1 (let [group (vim.api.nvim_create_augroup :lsp.typescript {:clear true})]
        (vim.api.nvim_create_autocmd :FileType {:pattern languages
                                                :callback (fn [e]
                                                            (on-ft-ts e)
                                                            nil)
                                                : group}))))

{: setup}
