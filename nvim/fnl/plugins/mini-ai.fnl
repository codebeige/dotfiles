(fn all-lines []
  (let [to-line (vim.fn.line :$)]
    {:from {:line 1
            :col 1}
     :to {:line to-line
          :col (-> to-line vim.fn.getline string.len (math.max 1))}
     :vis_mode :V}))

(fn first-char-col [line]
  (case (-> line vim.fn.getline (string.find "^%s*%S"))
    (_ x) x))

(fn last-char-col [line]
  (case (-> line vim.fn.getline (string.find "%S%s*$"))
    (x _) x))

(fn inner-line [count]
  (let [from-line (vim.fn.line :.)
        to-line (+ from-line (- count 1))]
    {:from {:line from-line
            :col (first-char-col from-line)}
     :to {:line to-line
          :col (last-char-col to-line)}
     :vis_mode :v}))

(fn lines [mode _ {:n_times n-times}]
  (case mode
    :a (all-lines)
    :i (inner-line n-times)))

(fn config []
  (let [mini-ai (require :mini.ai)]
    (mini-ai.setup
      {:custom_textobjects
       {:l (if (= 3 (vim.fn.has :nvim-0.13)) false lines)}
       :mappings
       {:around_next ">a"
        :inside_next ">i"
        :around_last "<a"
        :inside_last "<i"}})))

{: config}
