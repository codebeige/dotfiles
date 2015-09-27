;;; extensions.el --- miniml Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq miniml-pre-extensions
      '(
        ;; pre extension names go here
        ))

(setq miniml-post-extensions
      '(
        miniml-nyan-mode
        ))

;; For each extension, define a function %LAYERNAME%/init-<extension-name>
;;
;; (defun miniml/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun miniml/init-miniml-nyan-mode ()
  (add-hook 'nyan-mode-hook
            (lambda () (setq nyan-animate-nyancat nil
                             nyan-wavy-trail nil))))
