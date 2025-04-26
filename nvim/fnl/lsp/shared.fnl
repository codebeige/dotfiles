(local cmp-nvim-lsp (require :cmp_nvim_lsp))

(local capabilities
  (vim.tbl_deep_extend
    :force
    (vim.lsp.protocol.make_client_capabilities)
    (cmp-nvim-lsp.default_capabilities)))

(fn on-attach [{:buf buffer : data}]
  (let [which-key (require :which-key)
        telescope (require :telescope.builtin)
        client (vim.lsp.get_client_by_id data.client_id)
        group (vim.api.nvim_create_augroup (string.format "lsp.shared.%d" buffer) {:clear true})]

    (which-key.add
      [{1 "<LocalLeader>b" :group "buffer"}
       {1 "<LocalLeader>f" :group "find"}
       {1 "<LocalLeader>o" :group "option"}])

    (when (client:supports_method :textDocument/publishDiagnostics)
      (which-key.add
        [{1 "<LocalLeader>bd" 2 #(vim.diagnostic.setloclist) : buffer :desc "List diagnostics"}
         {1 "<LocalLeader>fd" 2 #(telescope.diagnostics) : buffer :desc "Diagnostics"}]))

    (when (client:supports_method :textDocument/references)
      (which-key.add
        [{1 "<LocalLeader>fr" 2 #(telescope.lsp_references) : buffer :desc "References"}
         {1 "grr" 2 #(vim.lsp.buf.references) : buffer :desc "List references"}]))

    (when (client:supports_method :textDocument/implementation)
      (which-key.add
        [{1 "gri" 2 #(vim.lsp.buf.implementation)  : buffer :desc "List implementations"}]))

    (when (client:supports_method :textDocument/documentSymbol)
      (which-key.add
        [{1 "<LocalLeader>fs" 2 #(telescope.lsp_document_symbols) : buffer :desc "Document symbols"}
         {1 "gO"  2 #(vim.lsp.buf.document_symbol) : buffer :desc "List symbols in buffer"}]))

    (when (client:supports_method :textDocument/signatureHelp)
      (which-key.add
        [{1 "<C-s>" 2 #(vim.lsp.buf.signature_help) : buffer :desc "Signature help"}]))

    (when (client:supports_method :textDocument/rename)
      (which-key.add
        [{1 "grn" 2 #(vim.lsp.buf.rename) : buffer :desc "Rename symbol..."}]))

    (when (client:supports_method :textDocument/codeAction)
      (which-key.add
        [{1 "gra" 2 #(vim.lsp.buf.code_action) : buffer :desc "Code action..." :mode [:n :x]}]))

    (when (client:supports_method :textDocument/formatting)
      (which-key.add
        [{1 "<LocalLeader>bq" 2 #(vim.lsp.buf.format {:async true}) : buffer :desc "Format buffer"}])
      (vim.api.nvim_create_autocmd :BufWritePre
                                   {:callback
                                    (fn [_]
                                      (vim.lsp.buf.format {:async false})
                                      nil)
                                    : buffer
                                    : group}))

    (when (client:supports_method :textDocument/documentHighlight)
      (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                                   {:callback
                                    (fn [_]
                                      (vim.lsp.buf.document_highlight)
                                      nil)
                                    : buffer
                                    : group})
      (vim.api.nvim_create_autocmd :CursorMoved
                                   {:callback
                                    (fn [_]
                                      (vim.lsp.buf.clear_references)
                                      nil)
                                    : buffer
                                    : group}))

    (when (client:supports_method :textDocument/inlayHint)
      (vim.lsp.inlay_hint.enable false {:bufnr buffer})
      (which-key.add
        [{1 "<LocalLeader>o[h" 2 #(vim.lsp.inlay_hint.enable true {:bufnr buffer}) : buffer :desc "Enable inlay hints"}
         {1 "<LocalLeader>o]h" 2 #(vim.lsp.inlay_hint.enable false {:bufnr buffer}) : buffer :desc "Disable inlay hints"}
         {1 "<LocalLeader>oyh" 2 #(vim.lsp.inlay_hint.enable (vim.lsp.inlay_hint.is_enabled) {:bufnr buffer}) : buffer :desc "Toggle inlay hints"}]))

    (when (client:supports_method :workspace/symbol)
      (which-key.add
        [{1 "<LocalLeader>fS" 2 #(telescope.lsp_workspace_symbols) : buffer :desc "Workspace symbols"}]))))

(fn update-colorscheme []
  (vim.api.nvim_set_hl 0 :LspReferenceText {:link :Visual})
  (vim.api.nvim_set_hl 0 :LspReferenceRead {:link :LspReferenceText})
  (vim.api.nvim_set_hl 0 :LspReferenceWrite {:link :LspReferenceText}))

(fn setup []
  (set (. vim.lsp.config :*) {: capabilities})

  (let [group (vim.api.nvim_create_augroup :lsp.shared {:clear true})]
    (vim.api.nvim_create_autocmd :LspAttach
                                 {:callback (fn [e] (on-attach e) nil)
                                  : group})
    (vim.api.nvim_create_autocmd :ColorScheme
                                 {:callback (fn [_]
                                              (update-colorscheme)
                                              nil)
                                  : group})
    (update-colorscheme)))

{: capabilities
 : setup}
