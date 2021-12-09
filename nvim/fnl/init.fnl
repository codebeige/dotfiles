(module init
  {autoload {nvim aniseed.nvim
             util lib.util}})

(nvim.ex.language "en_US.UTF-8")

(util.set-opts :o {:colorcolumn "80"
                   :cursorline true
                   :ignorecase true
                   :inccommand "split"
                   :mouse "a"
                   :number true
                   :smartcase true
                   :termguicolors true
                   :visualbell true})

(when (nvim.fn.executable "rg")
  (util.set-opts :o {:grepprg "rg --vimgrep --no-heading --smart-case"
                     :grepformat "%f:%l:%c:%m"}))

(require :mappings)
(require :plugins)
