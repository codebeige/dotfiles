lua << EOF
require'lspconfig'.clojure_lsp.setup{
  on_attach = function(client)
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local keymap_opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<cr>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<cr>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>==', '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
  end
}
EOF
