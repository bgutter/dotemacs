(message "SECTION: Bootstrap.")

;; Load custom
(setq custom-file "~/.emacs.d/emacs-config/custom.el")
(load-file custom-file)

;; Set up straight.el Need to do this before org-babel-load-file so
;; that the newest org (from straight.el) is the only one loaded.
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(add-to-list 'load-path "~/.emacs.d/emacs-config/lisp")

;; Kickoff main init
(use-package org)
(org-babel-load-file "~/.emacs.d/emacs-config/my-init.org")
