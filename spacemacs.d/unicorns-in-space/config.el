(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)

(setq cider-repl-pop-to-buffer-on-connect t)

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))


