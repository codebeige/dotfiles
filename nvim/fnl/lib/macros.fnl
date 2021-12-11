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

(fn with-restore-view [...]
  `(let [view# (vim.fn.winsaveview)]
     (do ,...)
     (vim.fn.winrestview view#)))

(fn set-operatorfunc [f]
  `(do
     (tset _G
           :_lib_macros_operatorfunc
           (fn []
             (tset _G :_lib_macros_operatorfunc nil)
             (,f)))
     (nvim.set_option :operatorfunc "v:lua._lib_macros_operatorfunc")))

{:augroup augroup
 :autocmd autocmd
 :with-restore-view with-restore-view
 :set-operatorfunc set-operatorfunc}
