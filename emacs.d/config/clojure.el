(require 'clojure-mode-extra-font-locking)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)


(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
