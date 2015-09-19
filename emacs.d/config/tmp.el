(defun user-emacs-tmp-dir (name)
  (let ((dir (concat user-emacs-directory name "/")))
    (unless (file-exists-p dir)
      (make-directory dir))
    dir))

(setq backup-directory-alist
      `((".*" . ,(user-emacs-tmp-dir "backups"))))

(setq auto-save-file-name-transforms
      `((".*" ,(user-emacs-tmp-dir "auto-save-files")) t))
