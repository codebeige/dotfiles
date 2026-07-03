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

(fn top-level-node [node]
  (-?> (node:tree)
       (: :root)
       (: :child_with_descendant node)))

(fn node->region [node]
  (let [[from-line from-col to-line to-col]
        (icollect [_ v (ipairs [(node:range)])] (+ 1 v))]
    {:from {:line from-line :col from-col}
     :to {:line to-line :col to-col}
     :vis_mode :V}))

(fn top-level-inner-block []
  (-?> (vim.treesitter.get_node) top-level-node node->region))

(fn blank? [s]
  (string.find s "^%s*$"))

(fn add-trailing-lines [{: from : to}]
  (var to-line to.line)
  (for [l to.line (vim.fn.line :$)
        &until (not (blank? (vim.fn.getline (+ 1 to-line))))]
    (set to-line l))
  {: from
   :to {:line to-line
        :col (-> to-line vim.fn.getline string.len (math.max 1))}})

(fn top-level-around-block []
  (-?> (top-level-inner-block) add-trailing-lines))

(fn top-level-block [mode]
  (case mode
    :i (top-level-inner-block)
    :a (top-level-around-block)))

(fn config []
  (let [mini-ai (require :mini.ai)
        mini-extra (require :mini.extra)]
    (mini-ai.setup
      {:custom_textobjects
       {:c (mini-ai.gen_spec.treesitter {:a "@class.outer"
                                         :i "@class.inner"})
        :f (mini-ai.gen_spec.treesitter {:a "@function.outer"
                                         :i "@function.inner"})
        :g (mini-ai.gen_spec.treesitter {:a "@comment.outer"
                                         :i "@comment.inner"})
        :i (mini-extra.gen_ai_spec.indent)
        :l (if (= 1 (vim.fn.has :nvim-0.13)) false lines)
        :r top-level-block}
       :mappings
       {:around_next "]a"
        :inside_next "]i"
        :around_last "[a"
        :inside_last "[i"}})))

{: config}
