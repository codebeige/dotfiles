(fn auto-format [buffer]
  (when (client:supports_method :textDocument/formatting)
    (let [group (vim.api.nvim_create_augroup (.. :auto-format- buffer)
                                             {:clear true})]
      (vim.api.nvim_create_autocmd :BufWritePre
                                   {:callback
                                    (fn [_]
                                      (vim.lsp.buf.format {:async false})
                                      nil)
                                    : buffer
                                    : group}))))

{: auto-format}
