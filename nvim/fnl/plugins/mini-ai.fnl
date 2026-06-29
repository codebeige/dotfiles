(fn buffer []
  (let [to-line (vim.fn.line :$)]
    {:from {:line 1
            :col 1}
     :to {:line to-line
          :col (-> to-line vim.fn.getline string.len (math.max 1))}}))

(fn first-char-col [line]
  (case (-> line vim.fn.getline (string.find "^%s+"))
    (_ x) (+ 1 x)
    nil 1))

(fn line [count]
  (let [from-line (vim.fn.line :.)
        from-col (first-char-col from-line)
        to-line (+ from-line (- count 1))]
    {:from {:line from-line
            :col from-col}
     :to {:line to-line
          :col (-> to-line vim.fn.getline string.len)}}))

(fn lines [mode _ {:n_times n-times}]
  (case mode
    :a (buffer)
    :i (line n-times)))

(fn config []
  (let [mini-ai (require :mini.ai)]
    (mini-ai.setup
      {:custom_textobjects
       {:l (if (= 1 (vim.fn.has :nvim-0.13)) false lines)}
       :mappings
       {:around_next ">a"
        :inside_next ">i"
        :around_last "<a"
        :inside_last "<i"}})))

{: config}
