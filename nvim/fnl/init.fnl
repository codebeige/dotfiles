(module init
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

(nvim.ex.language "en_US.UTF-8")

(core.merge! nvim.o {:mouse "a"})

(core.merge! nvim.g {:mapleader ","
                     :maplocalleader ",,"})
