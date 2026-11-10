(local token-path "op://Personal/GitHub Personal Access Token/token")

(fn get-token []
  (let [out (vim.fn.system [:op :read token-path])]
    (if (not= vim.v.shell_error 0)
        (vim.notify (.. "gh auth failed: " out) vim.log.levels.ERROR)
        (vim.trim out))))

(fn octo-stub [opts]
  (let [token (get-token)
        octo (require :octo)]
    (vim.api.nvim_del_user_command :Octo)
    (octo.setup {:enable_builtin true
                 :gh_env {:GH_TOKEN token}})
    (vim.cmd (.. "Octo " opts.args))))

(fn config []
  (vim.api.nvim_create_user_command :Octo octo-stub {:nargs "*"})
  (let [which-key (require :which-key)]
    (which-key.add [{1 "<Leader>gh" 2 "<Cmd>Octo<CR>" :desc "Octo"}])))

{: config}
