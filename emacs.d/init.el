;; modifier keys
(setq ns-alternate-modifier 'none)
(setq ns-command-modifier 'meta)

;; packages
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(defvar my-packages '(cider
                      paredit
                      solarized-theme
                      ido-vertical-mode
                      smex))

(setq package-pinned-packages '((cider . "melpa-stable")))

(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

;; appearance
(setq ring-bell-function 'ignore)

;; global navigation
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode 1)

;; commands
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; German keyboard
(defun escape-or-quit (prompt)
  (if (key-binding [escape]) [escape] (kbd "C-g")))
(define-key key-translation-map (kbd "C-ä") 'escape-or-quit)
(global-set-key (kbd "C-ü") (kbd "C-]"))

;; customized
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Source Code Pro")))))
