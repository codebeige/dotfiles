(module init
  {autoload {nvim aniseed.nvim
             util lib.util}})

(nvim.ex.language "en_US.UTF-8")

(util.set-opts :o {:colorcolumn "80"
                   :cursorline true
                   :mouse "a"
                   :number true
                   :termguicolors true
                   :visualbell true})

(require :mappings)
(require :plugins)
