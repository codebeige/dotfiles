(module config.init
  {autoload {nvim aniseed.nvim
             plugins lib.plugins
             util lib.util}
   require [config.colors
            config.mappings
            plugins.init]})

(nvim.ex.language "en_US.UTF-8")

(util.set-opts :o {:colorcolumn "80"
                   :cursorline true
                   :expandtab true
                   :ignorecase true
                   :inccommand "split"
                   :listchars "tab:→ ,nbsp:•,extends:»,precedes:«"
                   :mouse "a"
                   :number true
                   :shiftround true
                   :shiftwidth 0
                   :smartcase true
                   :tabstop 2
                   :termguicolors true
                   :visualbell true})

(when (nvim.fn.executable "rg")
  (util.set-opts :o {:grepprg "rg --vimgrep --no-heading --smart-case"
                     :grepformat "%f:%l:%c:%m"}))