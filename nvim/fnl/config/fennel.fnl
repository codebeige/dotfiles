(module config.fennel)

(defn update-syntax []
  (let [patterns vim.g.fennel_fuzzy_indent_patterns]
    (table.insert patterns "^with-")
    (table.insert patterns "^doto$")
    (set vim.g.fennel_fuzzy_indent_patterns patterns)))

(defn- init []
  (let [group (vim.api.nvim_create_augroup :config.fennel {:clear true})]
    (vim.api.nvim_create_autocmd :FileType
                                 {:callback update-syntax
                                  :group group
                                  :once true
                                  :pattern "fennel"}))
  true)

(defonce- loaded? (init))
