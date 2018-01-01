(defconst clojure-config-packages
  '(aggressive-indent-mode
    clojure-mode
    evil-cleverparens-mode))

(defun clojure-config/post-init-aggressive-indent-mode ()
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

(defun clojure-config/pre-init-clojure-mode ()
  (spacemacs|use-package-add-hook clojure-mode
    :post-config
    (define-clojure-indent
      (fdef :defn))))

(defun clojure-config/post-init-evil-cleverparens-mode ()
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode))
