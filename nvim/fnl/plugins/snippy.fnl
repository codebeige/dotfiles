(fn config []
  (let [snippy (require :snippy)]
    (snippy.setup
      {:mappings {:is {:<C-j> :expand_or_advance
                       :<C-k> :previous}
                  :x  {:<C-j> :cut_text}}})))

{: config}
