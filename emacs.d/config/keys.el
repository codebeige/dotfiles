(defun escape-or-quit (prompt)
  (if (key-binding [escape]) [escape] (kbd "C-g")))
(define-key key-translation-map (kbd "C-ä") 'escape-or-quit)

(global-set-key (kbd "C-ü") (kbd "C-]"))
