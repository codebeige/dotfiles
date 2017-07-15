(defun escape-or-quit (prompt)
  (interactive)
  (if (key-binding [escape]) [escape] (kbd "C-g")))
