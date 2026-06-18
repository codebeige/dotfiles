(local name :gopls)

(fn in-mod-cache? [dir]
  (-?> dir (vim.fs.root "pkg/mod")))

(fn reuse-client [client config]
  (and (= client.name config.name)
       (or (in-mod-cache? config.root-dir)
           (= client.root-dir config.root-dir))))

(local timeout 1000)

(fn resolve-action [client b action]
  (or (and (client:supports_method :codeAction/resolve)
           (case (client:request_sync :codeAction/resolve
                                      action
                                      timeout
                                      b)
             {: result} result))
      action))

(fn action-params [b]
  {:context {:diagnostics {} :only ["source.organizeImports"]}
   :range {:start {:line 0 :character 0}
           :end {:line 0 :character 0}}
   :textDocument (vim.lsp.util.make_text_document_params b)})

(fn organize-imports [client b]
  (case (client:request_sync
          :textDocument/codeAction
          (action-params b)
          timeout
          b)
    {: result} (each [_ action (pairs result)]
                 (case (resolve-action client b action)
                   {: edit} (vim.lsp.util.apply_workspace_edit
                              edit
                              client.offset_encoding)
                   {: command} (client:exec_cmd
                                 (if (= :table (type command)) command action)
                                 {:bufnr b})))))

(fn format [client b]
  (vim.lsp.buf.format {:async false :bufnr b :id client.id}))

(fn on-attach [client b]
  (vim.api.nvim_create_autocmd
    :BufWritePre
    {:buffer b
     :callback
     (fn [{: buf}]
       (organize-imports client buf)
       (format client buf))}))

(local config
  {:cmd ["gopls"]
   :filetypes [:go :gomod :gowork]
   :on_attach on-attach
   :root_markers [["go.work" "go.mod"] ".git"]
   :reuse_client reuse-client
   :settings {:gopls {:analyses {:shadow true
                                 :unusedparams true}
                      :completeUnimported true
                      :gofumpt true
                      :staticcheck true
                      :usePlaceholders true}}
   :single_file_support true})

{: name
 : config}
