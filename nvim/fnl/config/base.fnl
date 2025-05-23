(fn setup []
  (vim.cmd.language "en_US.UTF-8")

  (set vim.g.mapleader " ")
  (set vim.g.maplocalleader ",")

  (set vim.o.colorcolumn "80")
  (set vim.o.completeopt "menu,menuone,noselect")
  (set vim.o.conceallevel 2)
  (set vim.o.cursorline true)
  (set vim.o.diffopt (.. "vertical," vim.o.diffopt))
  (set vim.o.expandtab true)
  (set vim.o.exrc true)
  (set vim.o.ignorecase true)
  (set vim.o.inccommand "split")
  (set vim.o.listchars "tab:→ ,nbsp:•,extends:»,precedes:«")
  (set vim.o.mouse "a")
  (set vim.o.number true)
  (set vim.o.numberwidth 4)
  (set vim.o.shiftround true)
  (set vim.o.shiftwidth 0)
  (set vim.o.signcolumn "yes:1")
  (set vim.o.smartcase true)
  (set vim.o.tabstop 2)
  (set vim.o.termguicolors true)
  (set vim.o.title true)
  (set vim.o.undofile true)
  (set vim.o.updatetime 500)
  (set vim.o.visualbell true)
  (set vim.o.winborder :rounded)

  (set vim.g.python3_host_prog "/usr/local/opt/python/libexec/bin/python")
  (set vim.g.loaded_perl_provider 0)

  (when (vim.fn.executable "rg")
    (set vim.o.grepprg "rg --vimgrep --no-heading --smart-case")
    (set vim.o.grepformat "%f:%l:%c:%m")))

{: setup}
