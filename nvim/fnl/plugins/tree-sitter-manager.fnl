(local langs [:clojure
              :comment
              :css
              :diff
              :fennel
              :git_rebase
              :gitattributes
              :gitcommit
              :gitignore
              :go
              :gomod
              :gowork
              :gosum
              :gotmpl
              :html
              :java
              :javascript
              :jsdoc
              :json
              :json5
              :lua
              :luadoc
              :luap
              :make
              :markdown
              :markdown_inline
              :regex
              :vim])


(fn enable [_]
  (set vim.wo.foldmethod :expr)
  (set vim.wo.foldexpr "v:lua.vim.treesitter.foldexpr()")
  (set vim.wo.foldenable false))

(fn config []
  (let [{: setup} (require :tree-sitter-manager)]
    (setup {:auto_install true
            :ensure_installed langs}))
  (let [group (vim.api.nvim_create_augroup :treesitter {:clear true})]
    (vim.api.nvim_create_autocmd :FileType
                                 {:callback (fn [opts] (enable opts) nil)
                                  : group})))

{: config}
