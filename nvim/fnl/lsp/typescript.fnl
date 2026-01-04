(local name :ts-ls)

(local config
  {:cmd ["typescript-language-server" "--stdio"]
   :filetypes [:javascript :javascriptreact :typescript :typescriptreact]
   :root_markers ["tsconfig.json" "jsconfig.json" "package.json" ".git"]
   :init_options {:hostInfo "neovim"}})

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
