(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'guide-key)
(setq guide-key/guide-key-sequence t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)
