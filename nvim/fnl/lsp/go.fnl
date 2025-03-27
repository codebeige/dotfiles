(local name :gopls)

(local mod-dir->root-dir {})

(fn root-dir->mod-dir [root-dir]
  (accumulate [mod-dir nil
               k v (pairs mod-dir->root-dir)
               &until mod-dir]
    (if (= root-dir v) k)))

(fn mod-file->root-dir [file]
  (accumulate [root-dir nil
               k v (pairs mod-dir->root-dir)
               &until root-dir]
    (if (vim.startswith file k) v)))

(fn with-mod-dir [root f]
  (if (root-dir->mod-dir root)
    (f root)
    (let [on-exit (fn [{: code : stdout}]
                    (when (= 0 code)
                      (set (. mod-dir->root-dir (vim.trim stdout)) root))
                    (f root))]
      (case (pcall vim.system ["go" "env" "GOMODCACHE"] {:text true} on-exit)
        false (f root)))))

(local root-markers ["go.work" "go.mod" ".git"])

(fn root-dir [buffer f]
  (let [file (vim.api.nvim_buf_get_name buffer)]
    (case (mod-file->root-dir file)
      root (f root)
      _ (case (vim.fs.root file root-markers)
          root* (with-mod-dir root* f)
          _ (f nil)))))

(local config
  {:cmd ["gopls"]
   :filetypes ["go" "gomod" "gowork" "gotmpl"]
   :root_dir root-dir})

{: name
 : config
 : mod-dir->root-dir}
