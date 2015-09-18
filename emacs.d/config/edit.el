(global-linum-mode)
(global-hl-line-mode 1)
(nyan-mode t)

(add-hook 'prog-mode-hook
          'rainbow-delimiters-mode
          'show-paren-mode)


(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(global-set-key (kbd "C-ä") 'hippie-expand)

(require 'saveplace)
(setq-default save-place t)
