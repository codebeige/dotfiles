(module plugins.surround
  {autoload {util lib.util}})

(defn setup []
  (util.set-opts :g:surround_ {:no_insert_mappings true}))
