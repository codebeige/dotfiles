(module config.init
  {autoload {nvim aniseed.nvim
             plugins lib.plugins
             util lib.util}
   require [config.diagnostic
            config.highlight
            config.mappings
            plugins.init]})

(nvim.ex.language "en_US.UTF-8")

(util.set-opts :o {:colorcolumn "80"
                   :completeopt "menu,menuone,noselect"
                   :cursorline true
                   :expandtab true
                   :ignorecase true
                   :inccommand "split"
                   :listchars "tab:→ ,nbsp:•,extends:»,precedes:«"
                   :mouse "a"
                   :number true
                   :numberwidth 4
                   :shiftround true
                   :shiftwidth 0
                   :signcolumn "yes:1"
                   :smartcase true
                   :tabstop 2
                   :termguicolors true
                   :timeoutlen 250
                   :undofile true
                   :updatetime 250
                   :visualbell true})

(when (nvim.fn.executable "rg")
  (util.set-opts :o {:grepprg "rg --vimgrep --no-heading --smart-case"
                     :grepformat "%f:%l:%c:%m"}))
