(setq ring-bell-function 'ignore)

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(setq-default frame-title-format "%b (%f)")
(setq initial-frame-alist '((top . 50)
                            (left . 100)
                            (width . 120)
                            (height . 45)))

(set-face-attribute 'default nil :family "Source Code Pro" :height 145)

(setq solarized-use-variable-pitch nil)
(setq solarized-use-less-bold t)
(load-theme 'solarized-light t)
