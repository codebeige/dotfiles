(fn conj [t ...]
  (let [t* (or t [])]
    (each [_ v (ipairs [...])]
      (table.insert t* v))
    t*))

(local deep-merge (partial vim.tbl_deep_extend "keep"))

{: conj
 : deep-merge}
