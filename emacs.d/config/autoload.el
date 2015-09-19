(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

(require 'eldoc)
(eldoc-add-command 'paredit-backward-delete
                   'paredit-close-round)
