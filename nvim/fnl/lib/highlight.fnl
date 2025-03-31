(local border
  ["╭" "─" "╮" "│" "╯" "─" "╰" "│"])

(fn get-hl [name]
  (case (vim.api.nvim_get_hl 0 {:name name})
    {: link} (get-hl link)
    hl hl))

(fn make-italic [name]
  (let [hl (get-hl name)]
    (vim.api.nvim_set_hl 0 name (collect [k v (pairs hl) &into {:italic true}]
                                  k v))))

(fn link [name target]
  (vim.api.nvim_set_hl 0 name {:link target}))

(fn unlink [name]
  (let [hl (get-hl name)]
    (vim.api.nvim_set_hl 0 name (collect [k v (pairs hl)] k v))))

{: border
 : link
 : make-italic
 : unlink}
