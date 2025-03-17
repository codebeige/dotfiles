(local {: border} (require :config.ui))
(local cmp-nvim-lsp (require :cmp_nvim_lsp))

(local capabilities
  (vim.tbl_deep_extend
    :force
    (vim.lsp.protocol.make_client_capabilities)
    (cmp-nvim-lsp.default_capabilities)))

(fn on-attach [{:buf buffer : data}]
  (let [which-key (require :which-key)
        telescope (require :telescope.builtin)]
    (which-key.add
      [{1 "<LocalLeader>b" :group "buffer"}
       {1 "<LocalLeader>b=" 2 #(vim.lsp.buf.format {:async true}) : buffer :desc "Format buffer"}
       {1 "<LocalLeader>bd" 2 #(vim.diagnostic.setloclist)        : buffer :desc "List diagnostics"}

       {1 "<LocalLeader>f" :group "find"}
       {1 "<LocalLeader>fd" 2 #(telescope.diagnostics)           : buffer :desc "Diagnostics"}
       {1 "<LocalLeader>fr" 2 #(telescope.lsp_references)        : buffer :desc "References"}
       {1 "<LocalLeader>fs" 2 #(telescope.lsp_document_symbols)  : buffer :desc "Document symbols"}
       {1 "<LocalLeader>fS" 2 #(telescope.lsp_workspace_symbols) : buffer :desc "Workspace symbols"}

       {1 "grn" 2 #(vim.lsp.buf.rename)          : buffer :desc "Rename symbol..."}
       {1 "gra" 2 #(vim.lsp.buf.code_action)     : buffer :desc "Code action..." :mode [:n :x]}
       {1 "grr" 2 #(vim.lsp.buf.references)      : buffer :desc "List references"}
       {1 "gri" 2 #(vim.lsp.buf.implementation)  : buffer :desc "List implementations"}
       {1 "gO"  2 #(vim.lsp.buf.document_symbol) : buffer :desc "List symbols in buffer"}

       {1 "<C-s>" 2 #(vim.lsp.buf.signature_help) : buffer :desc "Signature help"}]))

  (let [client (vim.lsp.get_client_by_id data.client_id)]
    (if client.server_capabilities.documentHighlightProvider
      (let [group (vim.api.nvim_create_augroup (string.format "lsp.shared.buffer-%d" buffer) {:clear true})]
        (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                                     {: buffer
                                      :callback (fn [_]
                                                  (vim.lsp.buf.document_highlight)
                                                  nil)
                                      : group})
        (vim.api.nvim_create_autocmd :CursorMoved
                                     {: buffer
                                      :callback (fn [_]
                                                  (vim.lsp.buf.clear_references)
                                                  nil)
                                      : group})
        (vim.api.nvim_create_autocmd :BufWritePre
                                     {: buffer
                                      :callback (fn [_]
                                                  (vim.lsp.buf.format {:async false})
                                                  nil)
                                      : group})))))

(fn update-colorscheme []
  (vim.api.nvim_set_hl 0 :LspReferenceText {:link :Visual})
  (vim.api.nvim_set_hl 0 :LspReferenceRead {:link :LspReferenceText})
  (vim.api.nvim_set_hl 0 :LspReferenceWrite {:link :LspReferenceText}))

(fn setup []
  (set (. vim.lsp.handlers :textDocument/hover)
       (vim.lsp.with vim.lsp.handlers.hover {:border border}))
  (set (. vim.lsp.handlers :textDocument/signatureHelp)
       (vim.lsp.with vim.lsp.handlers.signature_help {:border border}))

  (let [group (vim.api.nvim_create_augroup :lsp.shared {:clear true})]
    (vim.api.nvim_create_autocmd :LspAttach
                                     {:callback (fn [e] (on-attach e) nil)
                                      : group})
    (vim.api.nvim_create_autocmd :ColorScheme {:callback (fn [_]
                                                          (update-colorscheme)
                                                          nil)
                                              : group})
    (update-colorscheme)))

{: capabilities
 : setup}
