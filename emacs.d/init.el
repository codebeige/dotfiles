;; modifier keys
(setq ns-alternate-modifier 'none)
(setq ns-command-modifier 'meta)

;; packages
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(paredit
                      clojure-mode
                      clojure-mode-extra-font-locking
                      cider
                      solarized-theme
                      ido-vertical-mode
                      smex
                      guide-key
                      nyan-mode
                      rainbow-delimiters))

(setq package-pinned-packages '((cider . "melpa-stable")))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; GUI
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(nyan-mode t)
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 120))

;; appearance
(load-theme 'solarized-light t)
(set-face-attribute 'default nil :family "Source Code Pro" :height 145)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; whitespace
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; global navigation
(setq vc-follow-symlinks t)
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

;; info
(require 'guide-key)
(setq guide-key/guide-key-sequence t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)

;; tempfiles
(defconst emacs-tmp-dir "~/.emacs-tmp/")
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


