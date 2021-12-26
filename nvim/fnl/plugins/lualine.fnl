(module plugins.lualine
  {autoload {lualine lualine
             util lib.util}})

(util.set-opts :o {:showmode false})

(lualine.setup {:options {:icons_enabled false
                          :theme "everforest"}})
