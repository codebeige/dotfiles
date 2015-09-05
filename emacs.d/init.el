;; modifier keys
(setq ns-alternate-modifier 'none)
(setq ns-command-modifier 'meta)

;; appearance
(setq ring-bell-function 'ignore)

;; packages
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(defvar my-packages '(cider paredit))

(setq package-pinned-packages '((cider . "melpa-stable")))

(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

;; customized
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
