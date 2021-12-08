(fn augroup [name ...]
  `(do
     (nvim.ex.augroup ,name)
     (nvim.ex.autocmd_)
     (do ,...)
     (nvim.ex.augroup :END)))

(fn cmd->viml [f]
  `(.. "lua require('" *module-name* "')['" ,(tostring f) "']()"))

(fn autocmd [...]
  (let [arg [...]
        l (length arg )]
    (tset arg l (cmd->viml (. arg l)))
    `(nvim.ex.autocmd ,(unpack arg))))

{:augroup augroup
 :autocmd autocmd}
