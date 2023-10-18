(local {: autoload} (require :nfnl.module))
(local treesitter (autoload :nvim-treesitter.configs))

(fn config []
  (treesitter.setup {:ensure_installed [:bash
                                        :clojure
                                        :comment
                                        :css
                                        :diff
                                        :dockerfile
                                        :dot
                                        :fennel
                                        :git_rebase
                                        :gitattributes
                                        :gitcommit
                                        :gitignore
                                        :graphql
                                        :html
                                        :java
                                        :javascript
                                        :jsdoc
                                        :json
                                        :json5
                                        :jsonc
                                        :lua
                                        :make
                                        :markdown
                                        :markdown_inline
                                        :mermaid
                                        :nix
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

                     :highlight {:enable true}

                     :incremental_selection
                     {:enable true
                      :keymaps {:init_selection "<LocalLeader>vv"
                                :node_decremental "<LocalLeader>vr"
                                :node_incremental "<LocalLeader>vm"
                                :scope_incremental "<LocalLeader>vM"}}

                     :indent {:enable true}})

  (set vim.o.foldmethod :expr)
  (set vim.o.foldexpr "nvim_treesitter#foldexpr()")
  (set vim.o.foldenable false))

{: config}
