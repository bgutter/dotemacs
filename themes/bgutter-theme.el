(deftheme bgutter
  "Bgutter's Theme")

(let
    ;; Text colors (brighter)
    ((bgutter-theme:pink            "HotPink1") ;; maybe "deeppink2"
     (bgutter-theme:purple          "orchid")
     (bgutter-theme:blue            "cornflower blue")
     (bgutter-theme:cyan            "light sky blue")
     (bgutter-theme:teal            "DarkSeaGreen1")
     (bgutter-theme:jade            "DarkOliveGreen1")
     (bgutter-theme:gold            "burlywood3") ;; maybe "goldenrod1"
     (bgutter-theme:pale-pink       "#FFC0CB")

     ;; Background colors (darker)
     (bgutter-theme:obnoxious-red         "firebrick")
     (bgutter-theme:obnoxious-green       "forestgreen")
     (bgutter-theme:obnoxious-yellow      "yellow")
     (bgutter-theme:obnoxious-yellow-dark "DarkGoldenrod4")
     (bgutter-theme:dark-violet           "#2c2656") ;; maybe "SlateBlue4"
     (bgutter-theme:light-violet          "#978ECD")

     ;; Gray-scale colors
     (bgutter-theme:white          "White")
     (bgutter-theme:bright-gray    "gray80")
     (bgutter-theme:gray           "gray53")
     (bgutter-theme:dark-gray      "gray30")
     (bgutter-theme:darker-gray    "gray15")
     (bgutter-theme:very-dark-gray "gray7")
     (bgutter-theme:black          "Black")

     ;; Fonts
     (bgutter-theme:font      "Liberation Sans")
     (bgutter-theme:mono-font "Noto Sans Mono"))

  (custom-theme-set-faces
   'bgutter

   ;; Basics
   `(default ((t (:inherit nil
                  :stipple nil
                  :background ,bgutter-theme:black
                  :foreground ,bgutter-theme:white
                  :inverse-video nil
                  :box nil
                  :strike-through nil
                  :overline nil
                  :underline nil
                  :slant normal
                  :weight normal
                  :height 75
                  :width normal
                  :family ,bgutter-theme:mono-font))))
   `(region ((t (:background ,bgutter-theme:dark-gray :extend t))))
   `(cursor ((t (:background ,bgutter-theme:white))))
   `(minibuffer-prompt ((t (:background ,bgutter-theme:dark-violet
                            :foreground ,bgutter-theme:white
                            :width semi-expanded
                            :box (:line-width 1 :color ,bgutter-theme:black :style pressed-button)))))
   `(fringe ((t (:inherit default :background ,bgutter-theme:black))))

   ;; Set outline levels
   `(outline-1 ((t (:foreground ,bgutter-theme:pink))))
   `(outline-2 ((t (:foreground ,bgutter-theme:purple))))
   `(outline-3 ((t (:foreground ,bgutter-theme:blue))))
   `(outline-4 ((t (:foreground ,bgutter-theme:cyan))))
   `(outline-5 ((t (:foreground ,bgutter-theme:teal))))
   `(outline-6 ((t (:foreground ,bgutter-theme:jade))))
   `(outline-7 ((t (:foreground ,bgutter-theme:gold))))

   ;; Set font-lock faces
   `(font-lock-comment-face       ((t (:foreground ,bgutter-theme:gray :slant oblique))))
   `(font-lock-doc-face           ((t (:foreground ,bgutter-theme:cyan :slant oblique))))
   `(font-lock-function-name-face ((t (:foreground ,bgutter-theme:purple))))
   `(font-lock-keyword-face       ((t (:foreground ,bgutter-theme:pink))))
   `(font-lock-preprocessor-face  ((t (:foreground ,bgutter-theme:jade))))
   `(font-lock-variable-name-face ((t (:foreground ,bgutter-theme:white))))
   `(font-lock-type-face          ((t (:foreground ,bgutter-theme:blue))))
   `(font-lock-string-face        ((t (:foreground ,bgutter-theme:gold))))

   ;; Font-lock tags
   `(font-lock-debug-tag-face ((t (  :background ,bgutter-theme:obnoxious-green
                                     :foreground ,bgutter-theme:white
                                     :underline t
                                     :weight bold))) t)
   `(font-lock-warning-tag-face ((t (:inherit font-lock-warning-face
                                     :background ,bgutter-theme:obnoxious-red
                                     :foreground ,bgutter-theme:white
                                     :underline t
                                     :weight bold))) t)

   ;; Bookmarks
   `(bm-face        ((t (:background ,bgutter-theme:pink :foreground ,bgutter-theme:black :extend t))))
   `(bm-fringe-face ((t (:foreground ,bgutter-theme:pink))))

   ;; org-agenda
   `(org-agenda-column-dateline ((t (:inherit org-column))))
   `(org-agenda-done ((t (:foreground ,bgutter-theme:gray))))
   `(org-agenda-structure ((t (:foreground ,bgutter-theme:purple))))
   `(org-scheduled ((t (:foreground ,bgutter-theme:gray))))
   `(org-scheduled-previously ((t (:foreground ,bgutter-theme:white :weight bold))))
   `(org-scheduled-today ((t (:foreground ,bgutter-theme:bright-gray))))
   `(org-upcoming-deadline ((t (:foreground ,bgutter-theme:pink :weight bold))))

   ;; org-blocks
   `(org-block ((t (:background ,bgutter-theme:very-dark-gray
                    :extend t))))
   `(org-block-end-line ((t (:background ,bgutter-theme:darker-gray
                             :foreground ,bgutter-theme:pale-pink
                             :box (:line-width 1 :color ,bgutter-theme:black :style pressed-button)
                             :weight bold
                             :extend t))))
   `(org-block-begin-line ((t (:inherit org-block-end-line))))

   ;; the emacs 27 tab-bar
   '(tab-bar ((t (:inherit default))))
   '(tab-bar-tab ((t (:inherit my-header-line-face :box (:line-width 1 :style released-button)))))
   '(tab-bar-tab-inactive ((t (:inherit my-header-line-inactive-face))))

   ;; org-habit (colorized to simplify -- don't personally need all of these
   ;; distinguished from one another)
   `(org-habit-alert-face          ((t (:background ,bgutter-theme:obnoxious-green))))
   `(org-habit-alert-future-face   ((t (:background ,bgutter-theme:obnoxious-green))))
   `(org-habit-clear-face          ((t (:background ,bgutter-theme:obnoxious-green))))
   `(org-habit-clear-future-face   ((t (:background ,bgutter-theme:obnoxious-green))))
   `(org-habit-ready-future-face   ((t (:background ,bgutter-theme:obnoxious-green))))
   `(org-habit-overdue-future-face ((t (:background ,bgutter-theme:obnoxious-red))))

   ;; Emacs calendar framework
   `(cfw:face-default-content ((t (:foreground ,bgutter-theme:obnoxious-red))))
   `(cfw:face-header ((t (:foreground ,bgutter-theme:white))))
   `(cfw:face-holiday ((t (:background ,bgutter-theme:very-dark-gray :foreground ,bgutter-theme:gold :weight bold))))
   `(cfw:face-select ((t (:background ,bgutter-theme:dark-gray))))
   `(cfw:face-sunday ((t (:inherit cfw:face-header))))
   `(cfw:face-title ((t (:foreground ,bgutter-theme:pink :weight bold :height 1.1))))
   `(cfw:face-today-title ((t (:background ,bgutter-theme:pink :weight bold))))
   `(cfw:face-toolbar ((t (:foreground ,bgutter-theme:blue))))
   `(cfw:face-toolbar-button-off ((t (:foreground ,bgutter-theme:gray :weight bold))))
   `(cfw:face-toolbar-button-on ((t (:foreground ,bgutter-theme:white :weight bold))))

   ;; Auto highlight-symbol mode
   `(ahs-face ((t (:background ,bgutter-theme:obnoxious-green :foreground ,bgutter-theme:black))))
   '(ahs-definition-face ((t (:inherit ahs-face))))
   `(ahs-plugin-defalt-face ((t nil)))
   `(ahs-plugin-whole-buffer-face ((t nil)))

   ;; Custom mode and header line
   ;; See my-init.org...I wrote this years ago & it's basically completely
   ;; isolated from emacs' built-in modeline faces.
   `(my-header-line-face ((t (:background ,bgutter-theme:dark-violet
                              :foreground ,bgutter-theme:white
                              :box nil
                              :weight bold))) t)
   `(my-header-line-inactive-face ((t (:inherit my-header-line-face
                                       :background ,bgutter-theme:darker-gray
                                       :foreground ,bgutter-theme:gray
                                       :box (:line-width 1 :color ,bgutter-theme:very-dark-gray)))) t)
   `(mode-line-buffer-name-face ((t (:inherit my-header-line-face
                                     :background ,bgutter-theme:light-violet
                                     :foreground ,bgutter-theme:dark-violet
                                     :weight extra-bold
                                     :family ,bgutter-theme:font))) t)
   `(mode-line-buffer-name-inactive-face ((t (:inherit mode-line-buffer-name-face
                                              :background ,bgutter-theme:darker-gray
                                              :foreground ,bgutter-theme:bright-gray
                                              :box (:line-width 1 :color ,bgutter-theme:very-dark-gray)))) t)
   `(mode-line-notification-face ((t (:inherit my-header-line-face
                                      :background ,bgutter-theme:obnoxious-red
                                      :foreground ,bgutter-theme:white
                                      :weight extra-bold
                                      :family ,bgutter-theme:mono-font))) t)
   `(mode-line-happy-notification-face ((t (:inherit mode-line-notification-face
                                            :background ,bgutter-theme:obnoxious-green))) t)
   `(mode-line-notification-inactive-face ((t (:inherit mode-line-notification-face :background ,bgutter-theme:dark-gray :box nil))) t)

   ;; Other
   `(anzu-mode-line ((t (:background ,bgutter-theme:dark-violet :foreground ,bgutter-theme:white :weight bold))))
   `(comint-highlight-prompt ((t (:inherit nil :slant italic :weight bold))))
   `(compilation-info ((t (:inherit success :foreground ,bgutter-theme:purple))))
   `(compilation-line-number ((t (:inherit font-lock-keyword-face :foreground ,bgutter-theme:cyan))))
   `(diff-file-header ((t (:background ,bgutter-theme:bright-gray :foreground ,bgutter-theme:black :weight bold))))
   `(diff-hl-change ((t (:background ,bgutter-theme:obnoxious-yellow-dark :foreground ,bgutter-theme:obnoxious-yellow))))
   `(hl-line ((t (:background ,bgutter-theme:darker-gray :extend t))))
   `(ein:cell-input-area ((t (:background ,bgutter-theme:darker-gray))))
   `(linum ((t (:inherit (shadow default) :background ,bgutter-theme:darker-gray))))
   `(show-paren-match ((t (:background ,bgutter-theme:dark-violet))))
   `(ecb-default-highlight-face ((t (:background ,bgutter-theme:dark-violet))))
   `(magit-item-highlight ((t (:background ,bgutter-theme:dark-violet))))
   `(notmuch-search-unread-face ((t (:background ,bgutter-theme:darker-gray :weight normal :extend t))))

   ;; Deprecated? -- delete eventually
   ;; `(stripe-highlight ((t (:background "gray10"))))
   ;; `(column-marker-1 ((t (:background "red"))))
   ;; `(vertical-border ((((type tty)) (:inherit mode-line-face))))
   ;; `(lazy-highlight ((t (:background "purple4"))))
   ;; `(menu ((t (:background "dim gray" :foreground "ghost white" :inverse-video t))))
   ;; `(isearch ((t (:background "purple1" :foreground "#eeeeec"))))
   ;; `(header-line ((t (:inherit default :background "gray17" :foreground "gray80" :box nil :weight bold))))
   ;; `(hide-region-after-string-face ((t (:inherit region :background "red" :weight bold))))
   ;; `(hide-region-before-string-face ((t (:inherit region :background "red" :weight bold))))
   ;; `(highlight-indentation-face ((t (:inherit fringe :background "gray13"))))
   ;; `(number-font-lock-face ((t (:inherit font-lock-string-face))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'bgutter)
