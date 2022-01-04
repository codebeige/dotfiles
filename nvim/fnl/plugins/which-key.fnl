(module plugins.which-key
  {autoload {util lib.util
             which-key which-key}})

(defn config []
  (util.set-opts :o {:timeoutlen 300})
  (which-key.setup {:icons {:breadcrumb "∑" :separator "→"}
                    :plugins {:presets false}
                    :show_help false
                    :triggers ["<Leader>" "<LocalLeader>"]}))
