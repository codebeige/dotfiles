(global-linum-mode)
(global-hl-line-mode 1)
(nyan-mode t)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(show-paren-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(global-set-key (kbd "C-ä") 'hippie-expand)

(require 'saveplace)
(setq-default save-place t)

(defun toggle-comment ()
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "C-c c") 'toggle-comment)

(global-company-mode)
