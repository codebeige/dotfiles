(fn format-range []
  (let [view (vim.fn.winsaveview)]
    (pcall #(vim.lsp.buf.range_formatting
              {}
              (vim.api.nvim_buf_get_mark 0 "[")
              (vim.api.nvim_buf_get_mark 0 "]")))
    (vim.fn.restview view)))

(fn format-move []
  (set vim.g.__operatorfunc (fn []
                              (pcall format-range)
                              (set vim.g.__operatorfunc nil)))
  (set vim.o.operatorfunc :v:lua.__operatorfunc))

(fn on-attach [{:buf buffer : data}]
  (let [which-key (require :which-key)
        telescope (require :telescope.builtin)]
    (which-key.add
      [{1 "<C-]>" 2 #(vim.lsp.buf.definition)   : buffer :desc "Jump to definition"}
       {1 "K"     2 #(vim.lsp.buf.hover)        : buffer :desc "Show documentation"}
       {1 "[d"    2 #(vim.diagnostic.goto_prev) : buffer :desc "Previous diagnostic"}
       {1 "]d"    2 #(vim.diagnostic.goto_next) : buffer :desc "Next diagnostic"}

       {1 "<LocalLeader>b" :group "buffer"}
       {1 "<LocalLeader>b=" 2 #(vim.lsp.buf.format {:async true}) : buffer :desc "Format buffer"}
       {1 "<LocalLeader>bd" 2 #(vim.diagnostic.setloclist)        : buffer :desc "List diagnostics"}

       {1 "<LocalLeader>f" :group "find"}
       {1 "<LocalLeader>fd" 2 #(telescope.diagnostics)           : buffer :desc "Diagnostics"}
       {1 "<LocalLeader>fr" 2 #(telescope.lsp_references)        : buffer :desc "References"}
       {1 "<LocalLeader>fs" 2 #(telescope.lsp_document_symbols)  : buffer :desc "Document symbols"}
       {1 "<LocalLeader>fS" 2 #(telescope.lsp_workspace_symbols) : buffer :desc "Workspace symbols"}

       {1 "<LocalLeader>q" :group "format"}
       {1 "<LocalLeader>qq" 2 "<Cmd>lua require('lsp')['format-move']()<CR>g@" : buffer :desc "Format lines to {motion}"}
       {1 "<LocalLeader>qq" 2 #(vim.lsp.buf.range_formatting)                  : buffer :desc "Format selection" :mode :v}

       {1 "<LocalLeader>xr" 2 #(vim.lsp.buf.rename)      : buffer :desc "Rename symbol..."}
       {1 "<LocalLeader>xx" 2 #(vim.lsp.buf.code_action) : buffer :desc "Code action..." :mode [:n :x]}

       {1 "<LocalLeader>v" :group "view"}
       {1 "<LocalLeader>vd" 2 #(vim.diagnostic.open_float)  : buffer :desc "View diagnostics"}
       {1 "<LocalLeader>vh" 2 #(vim.lsp.buf.signature_help) : buffer :desc "Signature help"}]))

  (let [client (vim.lsp.get_client_by_id (. data :client_id))]
    (if client.server_capabilities.documentHighlightProvider
      (let [g (vim.api.nvim_create_augroup (string.format "lib_lsp_%d" buffer) {:clear true})]
        (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                                     {:buffer 0
                                      :callback #(vim.lsp.buf.document_highlight)
                                      :group g})
        (vim.api.nvim_create_autocmd :CursorMoved
                                     {:buffer 0
                                      :callback #(vim.lsp.buf.clear_references)
                                      :group g}))))

  (let [g (vim.api.nvim_create_augroup :lsp-on-attach {:clear true})]
    (vim.api.nvim_create_autocmd :BufWritePre {:buffer 0
                                               :callback #(vim.lsp.buf.format {:async false})
                                               :group g})))

(fn setup [opts]
  (let [au-group (vim.api.nvim_create_augroup :lsp-setup {:clear true})]
    (vim.api.nvim_create_autocmd :LspAttach {:callback on-attach
                                             :group au-group}))
  (let [clojure (require :lsp.clojure)
        fennel (require :lsp.fennel)
        go (require :lsp.go)
        ts (require :lsp.ts)]
    (clojure.setup opts)
    (fennel.setup opts)
    (go.setup opts)
    (ts.setup opts)))

{: format-move
 : setup}
