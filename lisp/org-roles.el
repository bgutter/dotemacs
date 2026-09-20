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
;; For more thorough documentation, please see the README.org.
;;
;;; Code:

(require 'org)
(require 'org-ql)

;; Variales

(defcustom org-roles-handle-cache-file-path (locate-user-emacs-file ".org-roles-handle-cache.el")
  "File where known handles can be persisted. Used for autocompletion."
  :type 'file
  :group 'org-roles)

(defvar org-roles-known-handles nil
  "List of all known handles.")

;; Basic setters and getters for heading properties

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

(provide 'org-roles)

;;; org-roles.el ends here
