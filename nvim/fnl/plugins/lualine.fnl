(local fugitive-commit-name-regex
  (vim.regex "\\v^fugitive:%(//)=.{-}\\zs%(//|::)%(\\x{8}|[1-3])"))

(fn fugitive-commit-name* [fugitive-url]
  (match (fugitive-commit-name-regex:match_str fugitive-url)
    (where (start end) (< 8 (- end start)))
    (string.sub fugitive-url (+ start 3) end)

    (start end)
    (string.sub fugitive-url (+ start 1) end)

    nil ""))

(fn fugitive-commit-name []
  (fugitive-commit-name* (vim.api.nvim_buf_get_name 0)))

(fn config []
  (let [lualine (require :lualine)
        {: get-theme} (require :lib.lualine)]
  (lualine.setup {:inactive_sections {:lualine_c [fugitive-commit-name :filename]}
                  :options {:icons_enabled false
                            :theme get-theme}
                  :sections {:lualine_c [fugitive-commit-name :filename]}})

  (set vim.o.showmode false)))

{: config}
