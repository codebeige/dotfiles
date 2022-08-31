(module plugins.lualine
  {autoload {lualine lualine
             nvim aniseed.nvim
             util lib.util}})

(def- fugitive-commit-name-regex
  (vim.regex "\\v^fugitive:%(//)=.{-}\\zs%(//|::)%(\\x{8}|[1-3])"))

(defn- fugitive-commit-name* [fugitive-url]
  (match (fugitive-commit-name-regex:match_str fugitive-url)
    (where (start end) (< 8 (- end start)))
    (string.sub fugitive-url (+ start 3) end)

    (start end)
    (string.sub fugitive-url (+ start 1) end)

    nil ""))

(defn fugitive-commit-name []
  (fugitive-commit-name* (nvim.buf_get_name 0)))

; Keep current window always focused in cmdline mode.
; Prevents cmp to steal focus on cmdline completion
(var focused-win-id 0)

(defn statusline []
  (when (~= (vim.fn.mode) "c")
    (set focused-win-id (tonumber vim.g.actual_curwin)))
  (lualine.statusline (= focused-win-id (vim.fn.win_getid))))

(defn config []
  (lualine.setup {:inactive_sections {:lualine_c [fugitive-commit-name :filename]}
                  :options {:icons_enabled false
                            :theme "base16-auto"}
                  :sections {:lualine_c [fugitive-commit-name :filename]}})

  (util.set-opts :o {:showmode false
                     :statusline "%{%v:lua.require'plugins.lualine'.statusline()%}"}))
