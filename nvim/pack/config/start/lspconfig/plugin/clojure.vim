lua << EOF
require'lspconfig'.clojure_lsp.setup{
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true, silent=true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })

    -- list
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>lr', '<Cmd>lua vim.lsp.buf.references()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>ls', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>li', '<Cmd>lua vim.lsp.buf.incoming_calls()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>lo', '<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>', {})

    -- find
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>fs', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {})

    -- change
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>xx', '<Cmd>lua vim.lsp.buf.code_action()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<Leader>xx', '<Cmd>lua vim.lsp.buf.range_code_action()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>xr', '<Cmd>lua vim.lsp.buf.rename()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>xc', '<Cmd>lua require("lspconfig.clojure").cycle_coll()<CR>', {})

    -- formatting
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gq', '<Cmd>lua vim.lsp.buf.formatting()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'v', 'gq', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gq', '<Cmd>call lspconfig#clojure#format_move()<CR>g@', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gqq', 'gqaF', {})
  end
}
EOF
