(local {: autoload} (require :nfnl.module))
(local util (autoload :lib.util))
(local scratch (autoload :codebeige.scratch))

(require :config.diagnostic)
(require :config.fennel)
(require :config.highlight)
(require :config.mappings)
(require :plugins.init)

(vim.cmd.language "en_US.UTF-8")

(util.set-opts :o {:colorcolumn "80"
                   :completeopt "menu,menuone,noselect"
                   :cursorline true
                   :diffopt (.. "vertical," vim.o.diffopt)
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
                   :title true
                   :undofile true
                   :updatetime 500
                   :visualbell true})

(set vim.g.python3_host_prog "/usr/local/opt/python/libexec/bin/python")
(set vim.g.loaded_perl_provider 0)
(set vim.g.did_load_filetypes 0)
(set vim.g.do_filetype_lua 1)

(when (vim.fn.executable "rg")
  (util.set-opts :o {:grepprg "rg --vimgrep --no-heading --smart-case"
                     :grepformat "%f:%l:%c:%m"}))

(scratch.init)