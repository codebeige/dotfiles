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

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; list of packages
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


;; OS X only packages
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

;; pinned packages
(setq package-pinned-packages '((cider . "melpa-stable")))

;; install packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; whitespace
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

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

;; configuration
(add-to-list 'load-path "~/.emacs.d/config/")

;; OS X only
(when (memq window-system '(mac ns))
  (load "osx"))

(load "ui")
(load "nav")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

