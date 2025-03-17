(local {: capabilities} (require :lsp.shared))

(fn on-ft [{:buf buffer}]
  (vim.lsp.start
    {:name :fennel-ls
     :cmd ["fennel-ls"]
     :root_dir (vim.fs.root buffer ["flsproject.fnl" ".git"])
     : capabilities}))

(fn setup []
  (case (vim.fn.executable :fennel-ls)
    1 (let [group (vim.api.nvim_create_augroup :lsp.fennel {:clear true})]
        (vim.api.nvim_create_autocmd :FileType {:pattern :fennel
                                                :callback (fn [e]
                                                            (on-ft e)
                                                            nil)
                                                : group}))))

{: setup}
