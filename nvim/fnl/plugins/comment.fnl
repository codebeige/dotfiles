(module plugins.comment
  {autoload {which-key which-key}})

(defn config []
  (which-key.register {:name "Comment"
                       :c "Line"
                       :u "Comment section"}
                      {:mode "n" :prefix "gc"})
  (which-key.register {:gc "Comment"} {:mode "x"})
  (which-key.register {:gc "Comment section"} {:mode "o"})
  (which-key.register {:cgc "Change comment"} {:mode "n"}))
