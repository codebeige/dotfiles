(local {: capabilities} (require :lsp.shared))

(local mod-dir->root-dir {})

(fn root-dir->mod-dir [root-dir]
  (accumulate [mod-dir nil
               k v (pairs mod-dir->root-dir)
               &until mod-dir]
    (if (= root-dir v) k)))

(fn starts-with [prefix s]
  (= prefix (s:sub 1 (length prefix))))

(fn mod-file->root-dir [file]
  (let [f (vim.fs.joinpath vim.env.PWD file)]
    (accumulate [root-dir nil
                 k v (pairs mod-dir->root-dir)
                 &until root-dir]
      (if (starts-with k f) v))))

(fn with-mod-dir [root-dir f]
  (if (root-dir->mod-dir root-dir)
    (f root-dir)
    (let [on-exit (fn [{: code : stdout}]
                    (when (= 0 code)
                      (set (. mod-dir->root-dir (vim.trim stdout)) root-dir))
                    (f root-dir))]
      (case (pcall vim.system ["go" "env" "GOMODCACHE"] {:text true} on-exit)
        false (f root-dir)))))

(fn with-root-dir [file f]
  (case (mod-file->root-dir file)
    root-dir (f root-dir)
    _ (with-mod-dir (vim.fs.root file ["go.work" "go.mod" ".git"]) f)))

(fn on-ft [{:buf buffer : file}]
  (with-root-dir
    file
    (fn [root-dir]
      (vim.schedule
        #(vim.lsp.start
           {:name :gopls
            :cmd ["gopls"]
            :root_dir root-dir
            : capabilities}
           {:bufnr buffer})))))

(fn setup []
  (case (vim.fn.executable :gopls)
    1 (let [group (vim.api.nvim_create_augroup :lsp.go {:clear true})]
        (vim.api.nvim_create_autocmd :FileType
                                     {:pattern ["go" "gomod" "gowork" "gotmpl"]
                                      :callback (fn [e] (on-ft e) nil)
                                      : group}))))

{: setup}
