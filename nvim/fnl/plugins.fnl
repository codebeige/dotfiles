(module plugins
  {autoload {conjure config.conjure
             packer lib.packer}
   require {conjure config.conjure}})

(packer.use {:Olical/aniseed true
             :Olical/conjure true
             :Olical/nvim-local-fennel true
             :wbthomason/packer.nvim true})
