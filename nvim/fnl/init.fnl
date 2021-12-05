(module init
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

(nvim.ex.language "en_US.UTF-8")

(core.assoc nvim.o
            :mouse "a")

(core.assoc nvim.g
            :mapleader ","
            :maplocalleader ",,")

(require :plugins)
