(module init
  {autoload {nvim aniseed.nvim
             util lib.util}})

(nvim.ex.language "en_US.UTF-8")

(util.set-opts :o {:mouse "a"})

(require :plugins)
