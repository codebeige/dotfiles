(module plugins.lualine
  {autoload {lualine lualine
             nvim aniseed.nvim
             util lib.util}})

; Keep current window always focused in cmdline mode.
; Prevents cmp to steal focus on cmdline completion
(var focused-win-id 0)

(defn statusline []
  (when (~= (vim.fn.mode) "c")
    (set focused-win-id (tonumber vim.g.actual_curwin)))
  (lualine.statusline (= focused-win-id (vim.fn.win_getid))))

(defn config []
  (lualine.setup {:options {:icons_enabled false
                            :theme "everforest"}})

  (util.set-opts :o {:showmode false
                     :statusline "%{%v:lua.require'plugins.lualine'.statusline()%}"}))
