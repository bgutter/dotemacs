;;; org-roles.el --- Manage contributor relationships for tasks in org-mode and org-ql -*- lexical-binding: t; -*-

;; Copyright (C) 2026

;; Author: Brandon Guttersohn (brandon@guttersohn.org)
;; Version: 0.1.0
;; Package-Requires: ((org)(org-ql))
;; Keywords: management, teams, roles, assign, collaboration, delegation
;; URL: https://github.com/bgutter/org-roles

;;; Commentary:
;; This package allows you to manage assignment of tasks in `org-mode'
;; to other contributors. In addition to assignment, you can also
;; declare stakeholders and generic participants.
;;
;; People are represented in org-roles by handles. Handles can begin
;; with either @ or # symbols, and otherwise contain only dashes,
;; letters, or numbers. For example, @caden-cotard or #azele-lack. You
;; can customize the handle regex by customizing
;; `org-roles-handle-regexp'.
;;
;; Explicit role relationships are stored onto TODO headings as
;; properties. Explicit relationship types presently include ASSIGNEE,
;; STAKEHOLDERS, and PARTICIPANTS. `org-ql' predicate functions are
;; provided by this package to support querying these properties.
;;
;; Handles can also be used casually within headline text or body. A
;; special `org-ql' predicate, `mentions', is provided to retrieve
;; these casual mentions.
;;
;; Here is an example;
;;   * TODO [#C] Deliver miniature painting to #claire-keene
;;   :PROPERTIES:
;;   :ASSIGNEE: #caden-cotard
;;   :PARTICIPANTS: #hazel #maria
;;   :END:
;;   Completed painting today. #olive-cotard commented that it was
;;   very nice. #caden-cotard will drop it off tomorrow.
;;
;; `org-roles' has both a global minor-mode (`org-roles-mode') and a
;; buffer-local minor-mode (`org-roles-minor-mode'). Users should
;; usually just enable the global mode.You may trigger the local
;; minor-mode directly yourself on a per-buffer basis if you prefer.
;;
;; For more thorough documentation, please see the README.org.
;;
;;; Code:

(require 'org)
;?? (require 'org-ql)

;;
;; Variables
;;

(defcustom org-roles-handle-cache-file-path (locate-user-emacs-file ".org-roles-handle-cache.el")
  "File where known handles can be persisted. Used for autocompletion."
  :type 'file
  :group 'org-roles)

(defcustom org-roles-handle-regexp "[#@][a-zA-Z0-9-]+"
  "Regular expression used to identify handles. Default matches either
@this-pattern or #that-pattern."
  :type 'regexp
  :group 'org-roles
  :set (lambda (symbol value)
         ;; go through all current buffers and clear out the old regexp from font-lock
         ;; THEN set the new one
         (dolist (buffer (buffer-list))
           (with-current-buffer buffer
             (when (bound-and-true-p org-roles-minor-mode)
               (font-lock-remove-keywords nil `((,org-roles-handle-regexp . 'org-roles-handle-face)))
               (font-lock-add-keywords nil `((,value . 'org-roles-handle-face)))
               (if (fboundp 'font-lock-fontify-buffer)
                   (font-lock-fontify-buffer)))))
         (set-default symbol value)))

(defface org-roles-handle-face
  '((t :inherit font-lock-constant-face))
  "Face used to distinguise role handles, identified by `org-roles-handle-regexp'"
  :group 'org-roles)

(defvar org-roles-known-handles nil
  "List of all known handles. Persisted in
`org-roles-handle-cache-file-path', and can be rebuilt using
`org-roles-scan-for-handles'.")

;;
;; Minor Modes
;;

(define-minor-mode org-roles-minor-mode
  "Add fontlock settings for handles, and, save-hooks to maintain
`org-roles-known-handles' and its persitence file
`org-roles-handle-cache-file-path'"
  :lighter " Roles"
  :buffer-local t
  (if (bound-and-true-p org-roles-minor-mode)
      (font-lock-add-keywords nil `((,org-roles-handle-regexp . 'org-roles-handle-face)))
    (font-lock-remove-keywords nil `((,org-roles-handle-regexp . 'org-roles-handle-face))))
  (if (fboundp 'font-lock-fontify-buffer)
      (font-lock-fontify-buffer))
  ;; TODO save hooks
  )

(defun org-roles-minor-mode--turn-on ()
  "Handle global en/disable of `org-roles-minor-mode'."
  (if (derived-mode-p 'org-mode)
      (org-roles-minor-mode 1)))

(define-globalized-minor-mode org-roles-mode
  org-roles-minor-mode
  org-roles-minor-mode--turn-on)

;;
;; Basic setters and getters for heading properties
;;

;;;###autoload
(defun org-roles-assign (assignee)
  "Assign heading under point to a given handle. If nil, unassign."
  (interactive
   (list (completing-read "Assign To: " org-roles-known-handles)))
  (if assignee
      (org-set-property "ASSIGNEE" assignee)
    (org-delete-property "ASSIGNEE")))

;;;###autoload
(defun org-roles-unassign ()
  "Delete current assignee for heading under point."
  (interactive)
  (org-roles-assign nil))

(defun org-roles-get-assignee (&optional skip-inherit)
  "Get assignee for heading under point."
  (org-entry-get nil "ASSIGNEE" (not skip-inherit)))

;;
;; Utility functions
;;

(defun org-roles-scan-for-handles (files)
  "Visit a set of files and scan for new handles. Add any new handles into
`org-roles-known-handles'. If not-nil,
`org-roles-handle-cache-file-path' is then updated."
  ;; TODO
  )

;;;###autoload
(defun org-roles-find-handles-in-agenda-files ()
  "Wrapper for `org-roles-scan-for-handles' that just scans `org-agenda-files'."
  (org-roles-scan-for-handles org-agenda-files))

(provide 'org-roles)

;;; org-roles.el ends here
