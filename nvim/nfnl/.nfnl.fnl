(local fs (require :nfnl.fs))

{:fnl-path->lua-path #(-> (fs.fnl-path->lua-path $)
                          (string.gsub "nfnl/lua" "lua" 1))}
