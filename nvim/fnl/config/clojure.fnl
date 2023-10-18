(set vim.g.clojure_align_subforms true)

(set vim.g.clojure_fuzzy_indent true)
(set vim.g.clojure_fuzzy_indent_patterns
     ["^with" "^def" "^let" "-as$" "def$" "^reg-" "-loop$""^for-"])
(set vim.g.clojure_fuzzy_indent_blacklist
     ["-fn$" "\\v^with-%(meta|loading-context)$"])
(set vim.g.clojure_special_indent_words
     ["deftype" "defrecord" "reify" "proxy" "extend-type" "extend-protocol"
      "letfn"])

(fn init-buffer []
  (when (not vim.b.config_clojure_loaded)
    (set vim.bo.lispwords (.. vim.bo.lispwords ",cond,try,async"))
    (set vim.b.config_clojure_loaded true)))

(let [g (vim.api.nvim_create_augroup :config_clojure {:clear true})]
  (vim.api.nvim_create_autocmd :FileType {:callback init-buffer
                                          :group g
                                          :pattern "clojure"}))
