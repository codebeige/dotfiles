(setq evil-capslock-packages '(caps-lock))

(defun evil-capslock/init-caps-lock ()
  (use-package caps-lock
    :defer t
    :init
    (progn
      (define-key evil-insert-state-map (kbd "C-g c") 'caps-lock-mode)
      (define-key evil-normal-state-map (kbd "g C") 'caps-lock-mode))))
