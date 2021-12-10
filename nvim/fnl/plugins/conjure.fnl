(module plugins.conjure
  {autoload {util lib.util}})

(util.set-opts :g:conjure#

               {:eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]}
                :mapping#doc_word "vd"
                :mapping#prefix "<leader>"})
