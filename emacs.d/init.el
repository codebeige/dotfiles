;; set up package management
(require 'package)
(add-to-list 'package-archives
             '("marmelade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; list of packages
(defvar my-packages '(paredit
                      clojure-mode
                      clojure-mode-extra-font-locking
                      cider
                      solarized-theme
                      ido-vertical-mode
                      flx-ido
                      smex
                      guide-key
                      nyan-mode
                      rainbow-delimiters
                      projectile
                      company
                      magit
                      magit-gitflow
                      neotree))


;;; Mac only
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

;; pinned packages
(setq package-pinned-packages '((cider . "melpa-stable")))

;; initialize package manager
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; install packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; configuration
(add-to-list 'load-path "~/.emacs.d/config/")

(load "ui")
(load "nav")
(load "cmd")
(load "tmp")
(load "edit")
(load "autoload")
(load "elisp")
(load "clojure")
(load "git")

;;; Mac only
(when (memq window-system '(mac ns))
  (load "osx"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


