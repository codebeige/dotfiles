(setq vc-follow-symlinks t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

(setq ido-use-file-at-point 'guess)
(setq ffap-require-prefix t)

(require 'flx-ido)
(flx-ido-mode 1)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 15)
(setq recentf-max-saved-items 200)

(defun ido-recentf-open ()
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key (kbd "C-c f") 'ido-recentf-open)


(projectile-global-mode)
