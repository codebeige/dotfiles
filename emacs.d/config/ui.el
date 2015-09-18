(setq ring-bell-function 'ignore)

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(setq-default frame-title-format "%b (%f)")
(setq initial-frame-alist '((top . 100)
                            (left . 100)
                            (width . 120)
                            (height . 45)))

(load-theme 'solarized-light t)
(set-face-attribute 'default nil :family "Source Code Pro" :height 145)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(global-linum-mode)
(nyan-mode t)
