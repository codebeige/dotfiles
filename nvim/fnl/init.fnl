(module init
  {autoload {nvim aniseed.nvim
             util config.util}})

(nvim.ex.language "en_US.UTF-8")

(util.set-opts :o {:mouse "a"})

(util.set-opts :g {:mapleader ","
                   :maplocalleader ",,"})

(require :plugins)
