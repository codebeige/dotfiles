(fn config []
  (let [diffview (require :diffview)]
    (diffview.setup
      {:use_icons false
       ;; With icons off, diffview still indents files as if a folder icon
       ;; followed the fold sign, leaving them one column right of sibling
       ;; folders. A trailing space on the fold signs restores alignment.
       :signs {:fold_closed " " :fold_open " "}})))

{: config}
