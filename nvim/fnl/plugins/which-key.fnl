(local {: autoload} (require :nfnl.module))
(local which-key (autoload :which-key))

(fn config [_ opts]
  (which-key.setup opts)
  (which-key.add
    [{1 "[" :group "previous|above|up|enable"}
     {1 "]" :group "next|below|down|disable"}

     {1 "<Leader>b" :group "buffer"}
     {1 "<Leader>bq" 2 "<Cmd>confirm quit<CR>`"   :desc "Quit window"}
     {1 "<Leader>bQ" 2 "<Cmd>confirm quitall<CR>" :desc "Quit all windows"}
     {1 "<Leader>br" 2 "<Cmd>checktime %<CR>"     :desc "Refresh buffer"}
     {1 "<Leader>bR" 2 "<Cmd>checktime<CR>"       :desc "Refresh all buffers"}
     {1 "<Leader>bu" 2 "<Cmd>update<CR>"          :desc "Update buffer"}
     {1 "<Leader>bw" 2 "<Cmd>write<CR>"           :desc "Write buffer"}
     {1 "<Leader>bW" 2 "<Cmd>wall<CR>"            :desc "Write all buffers"}
     {1 "<Leader>bx" 2 "<Cmd>exit<CR>"            :desc "Exit buffer"}
     {1 "<Leader>bX" 2 "<Cmd>xqall<CR>"           :desc "Exit all buffers"}

     {1 "<Leader><CR>" 2 ":":desc "Enter command..." :silent false :mode [:n :x] }

     {1 "<Leader>s" :group "substitute"}
     {1 "<Leader>sb" 2 ":<C-U>%s/"    :desc "Substitute in buffer..."           :silent false}
     {1 "<Leader>sc" 2 ":<C-U>cdo s/" :desc "Substitute each quickfix entry..." :silent false}
     {1 "<Leader>sl" 2 ":<C-U>ldo s/" :desc "Substitute each location entry..." :silent false}
     {1 "<Leader>ss" 2 ":<C-U>s/"     :desc "Substitute in current line..."     :silent false}
     {1 "<Leader>ss" 2 ":s/"          :desc "Substitute in selection..."        :silent false :mode :x}

     {1 "<C-L>" 2 "<Esc>" :desc "Esc" :mode :i}

     {1 "<Leader>p" 2 "<Cmd>Lazy<CR>" :desc "Open plugin manager..."}]))

{1 :folke/which-key.nvim
 : config
 :opts
 {:delay 200
  :preset :modern
  :icons {:mappings false}
  :show_help false}}
