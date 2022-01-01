(module plugins.comment
  {autoload {nvim-comment nvim_comment}})

(defn config []
  (nvim-comment.setup {:create_mappings false}))
