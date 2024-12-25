(fn config []
  (let [{: setup} (require :nvim-treesitter.configs)]
    (setup {:ensure_installed [:clojure
                               :comment
                               :css
                               :diff
                               :dockerfile
                               :fennel
                               :git_rebase
                               :gitattributes
                               :gitcommit
                               :gitignore
                               :html
                               :http
                               :java
                               :javascript
                               :jsdoc
                               :json
                               :json5
                               :jsonc
                               :lua
                               :luadoc
                               :luap
                               :make
                               :markdown
                               :markdown_inline
                               :org
                               :python
                               :query
                               :regex
                               :ruby
                               :scss
                               :slint
                               :sql
                               :typescript
                               :vim
                               :yaml]

            :auto_install true

            :highlight
            {:enable true
             :additional_vim_regex_highlighting [:clojure
                                                 :fennel
                                                 :janet
                                                 :racket]}

            :incremental_selection
            {:enable true
             :keymaps {:init_selection "<LocalLeader>vv"
                       :node_decremental "<LocalLeader>vr"
                       :node_incremental "<LocalLeader>vm"
                       :scope_incremental "<LocalLeader>vM"}}

            :indent {:enable true}})

  (set vim.o.foldmethod :expr)
  (set vim.o.foldexpr "nvim_treesitter#foldexpr()")
  (set vim.o.foldenable false)))

{: config}
