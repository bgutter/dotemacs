(setq custom-file (concat (file-name-directory load-file-name) "custom.el"))
(load-file custom-file)
(org-babel-load-file (concat (file-name-directory load-file-name) "my-init.org"))
