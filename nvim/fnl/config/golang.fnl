(fn init-buffer [_]
  (set vim.bo.expandtab false)
  (set vim.bo.tabstop 4)
  (set vim.bo.shiftwidth 4)
  (set vim.bo.softtabstop 4))

(fn setup []
  (let [group (vim.api.nvim_create_augroup :config.golang {:clear true})]
    (vim.api.nvim_create_autocmd
      :FileType
      {:pattern [:go :gomod :gowork]
       :callback init-buffer
       : group})))

{: setup}
