(module lib.core)

(defn conj [t ...]
  (let [t* (or t [])]
    (each [_ v (ipairs [...])]
      (table.insert t* v))
    t*))

