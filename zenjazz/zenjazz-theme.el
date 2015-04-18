;;; zenjazz-theme.el --- A low contrast color theme for Emacs.

;; Copyright (C) 2011-2014 Bozhidar Batsov
;; Copyright (C) 2015 Ben McGinnes

;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/zenjazz-emacs
;; Version: 2.3-cvs

;; Fork Author: Ben McGinnes <ben@adversary.org>
;; URL: https://github.com/adversary-org/emacs-themes/zenjazz/
;; Version: 2.3-bdm

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A port of the popular Vim theme Zenjazz for Emacs 24, built on top
;; of the new built-in theme support in Emacs 24.

;;; Credits:

;; Jani Nurminen created the original theme for vim on such this port
;; is based.

;;; Code:

(deftheme zenjazz "The Zenjazz color theme")

;;; Color Palette

(defvar zenjazz-colors-alist
  '(("zenjazz-fg+1"     . "#303030")
    ("zenjazz-fg"       . "#c6a57b")
    ("zenjazz-fg-1"     . "#c6a57b")
    
    ("zenjazz-bg-2"     . "#000000")
    ("zenjazz-bg-1"     . "#101010")
    ("zenjazz-bg-05"    . "#151515")
    ("zenjazz-bg"       . "#151515")
    ("zenjazz-bg+05"    . "#202020")
    ("zenjazz-bg+1"     . "#303030")
    ("zenjazz-bg+2"     . "#505050")
    ("zenjazz-bg+3"     . "#606060")
    
    ("zenjazz-red+1"    . "#8d4a4a")
    ("zenjazz-red"      . "#953331")
    ("zenjazz-red-1"    . "#953331")
    ("zenjazz-red-2"    . "#953331")
    ("zenjazz-red-3"    . "#953331")
    ("zenjazz-red-4"    . "#953331")
    
    ("zenjazz-orange"   . "#ba5b34")

    ("zenjazz-yellow+1" . "#96a62d")
    ("zenjazz-yellow"   . "#909737")
    ("zenjazz-yellow-1" . "#909737")
    ("zenjazz-yellow-2" . "#909737")
    
    ("zenjazz-green-1"  . "#546a29")
    ("zenjazz-green"    . "#546a29")
    ("zenjazz-green+1"  . "#7e9960")
    ("zenjazz-green+2"  . "#7e9960")
    ("zenjazz-green+3"  . "#7e9960")
    ("zenjazz-green+4"  . "#7e9960")
    
    ("zenjazz-cyan"     . "#34676f")
    
    ("zenjazz-blue+1"   . "#5c737c")
    ("zenjazz-blue"     . "#385e6b")
    ("zenjazz-blue-1"   . "#385e6b")
    ("zenjazz-blue-2"   . "#385e6b")
    ("zenjazz-blue-3"   . "#385e6b")
    ("zenjazz-blue-4"   . "#385e6b")
    ("zenjazz-blue-5"   . "#385e6b")
    
    ("zenjazz-magenta"  . "#7f355e"))
  "List of Zenjazz colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro zenjazz-with-color-variables (&rest body)
  "`let' bind all colors defined in `zenjazz-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   zenjazz-colors-alist))
     ,@body))

;;; Theme Faces
(zenjazz-with-color-variables
  (custom-theme-set-faces
   'zenjazz
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,zenjazz-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,zenjazz-yellow-2 :underline t :weight normal))))
   `(default ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg))))
   `(cursor ((t (:foreground ,zenjazz-fg :background ,zenjazz-fg+1))))
   `(escape-glyph ((t (:foreground ,zenjazz-yellow :bold t))))
   `(fringe ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg+1))))
   `(header-line ((t (:foreground ,zenjazz-yellow
                                  :background ,zenjazz-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,zenjazz-bg-05))))
   `(success ((t (:foreground ,zenjazz-green :weight bold))))
   `(warning ((t (:foreground ,zenjazz-orange :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,zenjazz-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,zenjazz-green))))
   `(compilation-error-face ((t (:foreground ,zenjazz-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,zenjazz-fg))))
   `(compilation-info-face ((t (:foreground ,zenjazz-blue))))
   `(compilation-info ((t (:foreground ,zenjazz-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,zenjazz-green))))
   `(compilation-line-face ((t (:foreground ,zenjazz-yellow))))
   `(compilation-line-number ((t (:foreground ,zenjazz-yellow))))
   `(compilation-message-face ((t (:foreground ,zenjazz-blue))))
   `(compilation-warning-face ((t (:foreground ,zenjazz-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,zenjazz-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,zenjazz-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,zenjazz-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,zenjazz-fg-1))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,zenjazz-fg))))
   `(grep-error-face ((t (:foreground ,zenjazz-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,zenjazz-blue))))
   `(grep-match-face ((t (:foreground ,zenjazz-orange :weight bold))))
   `(match ((t (:background ,zenjazz-bg-1 :foreground ,zenjazz-orange :weight bold))))
;;;;; isearch
   `(isearch ((t (:foreground ,zenjazz-yellow-2 :weight bold :background ,zenjazz-bg+2))))
   `(isearch-fail ((t (:foreground ,zenjazz-fg :background ,zenjazz-red-4))))
   `(lazy-highlight ((t (:foreground ,zenjazz-yellow-2 :weight bold :background ,zenjazz-bg-05))))

   `(menu ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg))))
   `(minibuffer-prompt ((t (:foreground ,zenjazz-yellow))))
   `(mode-line
     ((,class (:foreground ,zenjazz-green+1
                           :background ,zenjazz-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,zenjazz-green-1
                      :background ,zenjazz-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,zenjazz-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,zenjazz-bg+2))))
   `(trailing-whitespace ((t (:background ,zenjazz-red))))
   `(vertical-border ((t (:foreground ,zenjazz-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,zenjazz-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,zenjazz-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,zenjazz-green-1))))
   `(font-lock-constant-face ((t (:foreground ,zenjazz-green+4))))
   `(font-lock-doc-face ((t (:foreground ,zenjazz-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,zenjazz-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,zenjazz-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,zenjazz-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,zenjazz-red))))
   `(font-lock-type-face ((t (:foreground ,zenjazz-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,zenjazz-orange))))
   `(font-lock-warning-face ((t (:foreground ,zenjazz-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,zenjazz-fg))))
   `(newsticker-default-face ((t (:foreground ,zenjazz-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,zenjazz-green+3))))
   `(newsticker-extra-face ((t (:foreground ,zenjazz-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,zenjazz-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,zenjazz-green))))
   `(newsticker-new-item-face ((t (:foreground ,zenjazz-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,zenjazz-red))))
   `(newsticker-old-item-face ((t (:foreground ,zenjazz-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,zenjazz-fg))))
   `(newsticker-treeview-face ((t (:foreground ,zenjazz-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,zenjazz-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,zenjazz-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,zenjazz-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,zenjazz-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,zenjazz-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,zenjazz-bg-1 :foreground ,zenjazz-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,zenjazz-fg-1 :background ,zenjazz-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg :inverse-video nil))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,zenjazz-green+1))))
   `(android-mode-error-face ((t (:foreground ,zenjazz-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,zenjazz-fg))))
   `(android-mode-verbose-face ((t (:foreground ,zenjazz-green))))
   `(android-mode-warning-face ((t (:foreground ,zenjazz-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,zenjazz-cyan :weight bold))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,zenjazz-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,zenjazz-yellow))))
   `(font-latex-italic-face ((t (:foreground ,zenjazz-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,zenjazz-orange))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,zenjazz-bg+3 :foreground ,zenjazz-bg-2))))
   `(ac-selection-face ((t (:background ,zenjazz-blue-4 :foreground ,zenjazz-fg))))
   `(popup-tip-face ((t (:background ,zenjazz-yellow-2 :foreground ,zenjazz-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,zenjazz-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,zenjazz-bg-1))))
   `(popup-isearch-match ((t (:background ,zenjazz-bg :foreground ,zenjazz-fg))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,zenjazz-orange :background ,zenjazz-bg+1))))
   `(company-tooltip-selection ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg-1))))
   `(company-tooltip-mouse ((t (:background ,zenjazz-bg-1))))
   `(company-tooltip-common ((t (:foreground ,zenjazz-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,zenjazz-green+2))))
   `(company-scrollbar-fg ((t (:background ,zenjazz-bg-1))))
   `(company-scrollbar-bg ((t (:background ,zenjazz-bg+2))))
   `(company-preview ((t (:background ,zenjazz-green+2))))
   `(company-preview-common ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg-1))))
;;;;; bm
   `(bm-face ((t (:background ,zenjazz-yellow-1 :foreground ,zenjazz-bg))))
   `(bm-fringe-face ((t (:background ,zenjazz-yellow-1 :foreground ,zenjazz-bg))))
   `(bm-fringe-persistent-face ((t (:background ,zenjazz-green-1 :foreground ,zenjazz-bg))))
   `(bm-persistent-face ((t (:background ,zenjazz-green-1 :foreground ,zenjazz-bg))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,zenjazz-cyan))))
   `(circe-my-message-face ((t (:foreground ,zenjazz-fg))))
   `(circe-fool-face ((t (:foreground ,zenjazz-red+1))))
   `(circe-topic-diff-removed-face ((t (:foreground ,zenjazz-red :weight bold))))
   `(circe-originator-face ((t (:foreground ,zenjazz-fg))))
   `(circe-server-face ((t (:foreground ,zenjazz-green))))
   `(circe-topic-diff-new-face ((t (:foreground ,zenjazz-orange :weight bold))))
   `(circe-prompt-face ((t (:foreground ,zenjazz-orange :background ,zenjazz-bg :weight bold))))
;;;;; clojure-test-mode
   `(clojure-test-failure-face ((t (:foreground ,zenjazz-orange :weight bold :underline t))))
   `(clojure-test-error-face ((t (:foreground ,zenjazz-red :weight bold :underline t))))
   `(clojure-test-success-face ((t (:foreground ,zenjazz-green+1 :weight bold :underline t))))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,zenjazz-blue :foreground ,zenjazz-bg))))
   `(ctbl:face-continue-bar ((t (:background ,zenjazz-bg-05 :foreground ,zenjazz-bg))))
   `(ctbl:face-row-select ((t (:background ,zenjazz-cyan :foreground ,zenjazz-bg))))
;;;;; diff
   `(diff-added ((,class (:foreground ,zenjazz-green+4 :background nil))
                 (t (:foreground ,zenjazz-green-1 :background nil))))
   `(diff-changed ((t (:foreground ,zenjazz-yellow))))
   `(diff-removed ((,class (:foreground ,zenjazz-red :background nil))
                   (t (:foreground ,zenjazz-red-3 :background nil))))
   `(diff-refine-added ((t (:inherit diff-added :weight bold))))
   `(diff-refine-change ((t (:inherit diff-changed :weight bold))))
   `(diff-refine-removed ((t (:inherit diff-removed :weight bold))))
   `(diff-header ((,class (:background ,zenjazz-bg+2))
                  (t (:background ,zenjazz-fg :foreground ,zenjazz-bg))))
   `(diff-file-header
     ((,class (:background ,zenjazz-bg+2 :foreground ,zenjazz-fg :bold t))
      (t (:background ,zenjazz-fg :foreground ,zenjazz-bg :bold t))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,zenjazz-blue-2 :background ,zenjazz-bg-05))))
   `(diff-hl-delete ((,class (:foreground ,zenjazz-red+1 :background ,zenjazz-bg-05))))
   `(diff-hl-insert ((,class (:foreground ,zenjazz-green+1 :background ,zenjazz-bg-05))))
   `(diff-hl-unknown ((,class (:foreground ,zenjazz-yellow :background ,zenjazz-bg-05))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,zenjazz-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,zenjazz-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,zenjazz-orange))))
   `(diredp-date-time ((t (:foreground ,zenjazz-magenta))))
   `(diredp-deletion ((t (:foreground ,zenjazz-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,zenjazz-red))))
   `(diredp-dir-heading ((t (:foreground ,zenjazz-blue :background ,zenjazz-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,zenjazz-cyan))))
   `(diredp-exec-priv ((t (:foreground ,zenjazz-red))))
   `(diredp-executable-tag ((t (:foreground ,zenjazz-green+1))))
   `(diredp-file-name ((t (:foreground ,zenjazz-blue))))
   `(diredp-file-suffix ((t (:foreground ,zenjazz-green))))
   `(diredp-flag-mark ((t (:foreground ,zenjazz-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,zenjazz-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,zenjazz-red))))
   `(diredp-link-priv ((t (:foreground ,zenjazz-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,zenjazz-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,zenjazz-orange))))
   `(diredp-no-priv ((t (:foreground ,zenjazz-fg))))
   `(diredp-number ((t (:foreground ,zenjazz-green+1))))
   `(diredp-other-priv ((t (:foreground ,zenjazz-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,zenjazz-red-1))))
   `(diredp-read-priv ((t (:foreground ,zenjazz-green-1))))
   `(diredp-symlink ((t (:foreground ,zenjazz-yellow))))
   `(diredp-write-priv ((t (:foreground ,zenjazz-magenta))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,zenjazz-fg :background ,zenjazz-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,zenjazz-fg :background ,zenjazz-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,zenjazz-fg :background ,zenjazz-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,zenjazz-fg :background ,zenjazz-blue-5))))
   `(ediff-even-diff-A ((t (:background ,zenjazz-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,zenjazz-bg+1))))
   `(ediff-even-diff-B ((t (:background ,zenjazz-bg+1))))
   `(ediff-even-diff-C ((t (:background ,zenjazz-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,zenjazz-fg :background ,zenjazz-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,zenjazz-fg :background ,zenjazz-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,zenjazz-fg :background ,zenjazz-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,zenjazz-fg :background ,zenjazz-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,zenjazz-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,zenjazz-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,zenjazz-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,zenjazz-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,zenjazz-fg))))
   `(egg-help-header-1 ((t (:foreground ,zenjazz-yellow))))
   `(egg-help-header-2 ((t (:foreground ,zenjazz-green+3))))
   `(egg-branch ((t (:foreground ,zenjazz-yellow))))
   `(egg-branch-mono ((t (:foreground ,zenjazz-yellow))))
   `(egg-term ((t (:foreground ,zenjazz-yellow))))
   `(egg-diff-add ((t (:foreground ,zenjazz-green+4))))
   `(egg-diff-del ((t (:foreground ,zenjazz-red+1))))
   `(egg-diff-file-header ((t (:foreground ,zenjazz-yellow-2))))
   `(egg-section-title ((t (:foreground ,zenjazz-yellow))))
   `(egg-stash-mono ((t (:foreground ,zenjazz-green+4))))
;;;;; elfeed
   `(elfeed-search-date-face ((t (:foreground ,zenjazz-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,zenjazz-green))))
   `(elfeed-search-feed-face ((t (:foreground ,zenjazz-cyan))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,zenjazz-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,zenjazz-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,zenjazz-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,zenjazz-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg))))
   `(w3m-lnum-match ((t (:background ,zenjazz-bg-1
                                     :foreground ,zenjazz-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,zenjazz-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,zenjazz-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,zenjazz-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,zenjazz-yellow))))
   `(erc-keyword-face ((t (:foreground ,zenjazz-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,zenjazz-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,zenjazz-green))))
   `(erc-pal-face ((t (:foreground ,zenjazz-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,zenjazz-orange :background ,zenjazz-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,zenjazz-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,zenjazz-green+4 :background ,zenjazz-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,zenjazz-red :background ,zenjazz-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,zenjazz-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,zenjazz-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,zenjazz-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,zenjazz-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,zenjazz-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,zenjazz-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-red-1) :inherit unspecified))
      (t (:foreground ,zenjazz-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-yellow) :inherit unspecified))
      (t (:foreground ,zenjazz-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-cyan) :inherit unspecified))
      (t (:foreground ,zenjazz-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,zenjazz-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,zenjazz-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,zenjazz-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,zenjazz-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,zenjazz-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-orange) :inherit unspecified))
      (t (:foreground ,zenjazz-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-red) :inherit unspecified))
      (t (:foreground ,zenjazz-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,zenjazz-fg))))
   `(ack-file ((t (:foreground ,zenjazz-blue))))
   `(ack-line ((t (:foreground ,zenjazz-yellow))))
   `(ack-match ((t (:foreground ,zenjazz-orange :background ,zenjazz-bg-1 :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,zenjazz-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,zenjazz-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,zenjazz-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,zenjazz-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,zenjazz-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,zenjazz-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,zenjazz-magenta :weight bold))))
;;;;; git-rebase-mode
   `(git-rebase-hash ((t (:foreground, zenjazz-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-from))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((t (:foreground ,zenjazz-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,zenjazz-blue))))
   `(gnus-summary-high-read ((t (:foreground ,zenjazz-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,zenjazz-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,zenjazz-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,zenjazz-blue))))
   `(gnus-summary-low-read ((t (:foreground ,zenjazz-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,zenjazz-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,zenjazz-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,zenjazz-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,zenjazz-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,zenjazz-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,zenjazz-fg))))
   `(gnus-summary-selected ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,zenjazz-blue))))
   `(gnus-cite-10 ((t (:foreground ,zenjazz-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,zenjazz-yellow))))
   `(gnus-cite-2 ((t (:foreground ,zenjazz-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,zenjazz-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,zenjazz-green+2))))
   `(gnus-cite-5 ((t (:foreground ,zenjazz-green+1))))
   `(gnus-cite-6 ((t (:foreground ,zenjazz-green))))
   `(gnus-cite-7 ((t (:foreground ,zenjazz-red))))
   `(gnus-cite-8 ((t (:foreground ,zenjazz-red-1))))
   `(gnus-cite-9 ((t (:foreground ,zenjazz-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,zenjazz-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,zenjazz-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,zenjazz-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,zenjazz-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,zenjazz-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,zenjazz-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,zenjazz-bg+2))))
   `(gnus-signature ((t (:foreground ,zenjazz-yellow))))
   `(gnus-x ((t (:background ,zenjazz-fg :foreground ,zenjazz-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,zenjazz-blue))))
   `(guide-key/key-face ((t (:foreground ,zenjazz-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,zenjazz-green+1))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,zenjazz-green
                      :background ,zenjazz-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,zenjazz-yellow
                      :background ,zenjazz-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,zenjazz-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,zenjazz-bg+1))))
   `(helm-visible-mark ((t (:foreground ,zenjazz-bg :background ,zenjazz-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,zenjazz-green+4 :background ,zenjazz-bg-1))))
   `(helm-separator ((t (:foreground ,zenjazz-red :background ,zenjazz-bg))))
   `(helm-time-zone-current ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg))))
   `(helm-time-zone-home ((t (:foreground ,zenjazz-red :background ,zenjazz-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,zenjazz-orange :background ,zenjazz-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,zenjazz-magenta :background ,zenjazz-bg))))
   `(helm-bookmark-info ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg))))
   `(helm-bookmark-man ((t (:foreground ,zenjazz-yellow :background ,zenjazz-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,zenjazz-magenta :background ,zenjazz-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,zenjazz-red :background ,zenjazz-bg))))
   `(helm-buffer-process ((t (:foreground ,zenjazz-cyan :background ,zenjazz-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg))))
   `(helm-buffer-size ((t (:foreground ,zenjazz-fg-1 :background ,zenjazz-bg))))
   `(helm-ff-directory ((t (:foreground ,zenjazz-cyan :background ,zenjazz-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,zenjazz-red :background ,zenjazz-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,zenjazz-yellow :background ,zenjazz-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,zenjazz-bg :background ,zenjazz-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,zenjazz-cyan :background ,zenjazz-bg))))
   `(helm-grep-file ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg))))
   `(helm-grep-finish ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg))))
   `(helm-grep-lineno ((t (:foreground ,zenjazz-fg-1 :background ,zenjazz-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,zenjazz-red :background ,zenjazz-bg))))
   `(helm-moccur-buffer ((t (:foreground ,zenjazz-cyan :background ,zenjazz-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,zenjazz-fg-1 :background ,zenjazz-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg+1))))
   `(helm-swoop-target-word-face ((t (:foreground ,zenjazz-yellow :background ,zenjazz-bg+2 :weight bold))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,zenjazz-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,zenjazz-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,zenjazz-bg+1))
                   (t :weight bold)))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,zenjazz-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,zenjazz-yellow))))
   `(ido-indicator ((t (:foreground ,zenjazz-yellow :background ,zenjazz-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,zenjazz-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,zenjazz-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,zenjazz-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,zenjazz-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,zenjazz-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,zenjazz-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,zenjazz-red+1))))
   `(jabber-activity-face((t (:foreground ,zenjazz-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,zenjazz-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,zenjazz-orange))))
   `(js2-error ((t (:foreground ,zenjazz-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,zenjazz-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,zenjazz-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,zenjazz-green+3))))
   `(js2-function-param ((t (:foreground, zenjazz-green+3))))
   `(js2-external-variable ((t (:foreground ,zenjazz-orange))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,zenjazz-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,zenjazz-fg :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,zenjazz-bg+1))))
   `(ledger-font-pending-face ((t (:foreground ,zenjazz-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,zenjazz-fg))))
   `(ledger-font-posting-account-face ((t (:foreground ,zenjazz-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,zenjazz-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,zenjazz-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,zenjazz-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,zenjazz-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,zenjazz-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,zenjazz-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,zenjazz-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,zenjazz-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,zenjazz-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,zenjazz-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg))))
;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,zenjazz-blue-1))))
   `(lui-hilight-face ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,zenjazz-green+2 :background ,zenjazz-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,zenjazz-red+1 :background ,zenjazz-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,zenjazz-blue+1 :background ,zenjazz-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,zenjazz-magenta :background ,zenjazz-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,zenjazz-yellow :background ,zenjazz-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
   `(magit-item-highlight ((t (:background ,zenjazz-bg+05))))
   `(magit-section-title ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(magit-process-ok ((t (:foreground ,zenjazz-green :weight bold))))
   `(magit-process-ng ((t (:foreground ,zenjazz-red :weight bold))))
   `(magit-branch ((t (:foreground ,zenjazz-blue :weight bold))))
   `(magit-log-author ((t (:foreground ,zenjazz-orange))))
   `(magit-log-sha1 ((t (:foreground, zenjazz-orange))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,zenjazz-green+1))))
   `(message-header-other ((t (:foreground ,zenjazz-green))))
   `(message-header-to ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(message-header-from ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,zenjazz-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,zenjazz-green))))
   `(message-mml ((t (:foreground ,zenjazz-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,zenjazz-orange))))
   `(mew-face-header-from ((t (:foreground ,zenjazz-yellow))))
   `(mew-face-header-date ((t (:foreground ,zenjazz-green))))
   `(mew-face-header-to ((t (:foreground ,zenjazz-red))))
   `(mew-face-header-key ((t (:foreground ,zenjazz-green))))
   `(mew-face-header-private ((t (:foreground ,zenjazz-green))))
   `(mew-face-header-important ((t (:foreground ,zenjazz-blue))))
   `(mew-face-header-marginal ((t (:foreground ,zenjazz-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,zenjazz-red))))
   `(mew-face-header-xmew ((t (:foreground ,zenjazz-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,zenjazz-red))))
   `(mew-face-body-url ((t (:foreground ,zenjazz-orange))))
   `(mew-face-body-comment ((t (:foreground ,zenjazz-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,zenjazz-green))))
   `(mew-face-body-cite2 ((t (:foreground ,zenjazz-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,zenjazz-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,zenjazz-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,zenjazz-red))))
   `(mew-face-mark-review ((t (:foreground ,zenjazz-blue))))
   `(mew-face-mark-escape ((t (:foreground ,zenjazz-green))))
   `(mew-face-mark-delete ((t (:foreground ,zenjazz-red))))
   `(mew-face-mark-unlink ((t (:foreground ,zenjazz-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,zenjazz-green))))
   `(mew-face-mark-unread ((t (:foreground ,zenjazz-red-2))))
   `(mew-face-eof-message ((t (:foreground ,zenjazz-green))))
   `(mew-face-eof-part ((t (:foreground ,zenjazz-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,zenjazz-cyan :background ,zenjazz-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,zenjazz-bg :background ,zenjazz-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,zenjazz-bg :background ,zenjazz-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,zenjazz-blue))))
   `(mingus-pausing-face ((t (:foreground ,zenjazz-magenta))))
   `(mingus-playing-face ((t (:foreground ,zenjazz-cyan))))
   `(mingus-playlist-face ((t (:foreground ,zenjazz-cyan ))))
   `(mingus-song-file-face ((t (:foreground ,zenjazz-yellow))))
   `(mingus-stopped-face ((t (:foreground ,zenjazz-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,zenjazz-yellow))))
   `(nav-face-button-num ((t (:foreground ,zenjazz-cyan))))
   `(nav-face-dir ((t (:foreground ,zenjazz-green))))
   `(nav-face-hdir ((t (:foreground ,zenjazz-red))))
   `(nav-face-file ((t (:foreground ,zenjazz-fg))))
   `(nav-face-hfile ((t (:foreground ,zenjazz-red-4))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,zenjazz-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,zenjazz-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,zenjazz-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,zenjazz-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,zenjazz-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,zenjazz-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,zenjazz-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,zenjazz-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,zenjazz-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,zenjazz-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,zenjazz-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,zenjazz-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,zenjazz-bg+1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,zenjazz-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,zenjazz-fg :weight bold))))
   `(org-checkbox ((t (:background ,zenjazz-bg+2 :foreground ,zenjazz-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,zenjazz-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,zenjazz-red-1))))
   `(org-done ((t (:bold t :weight bold :foreground ,zenjazz-green+3))))
   `(org-formula ((t (:foreground ,zenjazz-yellow-2))))
   `(org-headline-done ((t (:foreground ,zenjazz-green+3))))
   `(org-hide ((t (:foreground ,zenjazz-bg-1))))
   `(org-level-1 ((t (:foreground ,zenjazz-orange))))
   `(org-level-2 ((t (:foreground ,zenjazz-green+4))))
   `(org-level-3 ((t (:foreground ,zenjazz-blue-1))))
   `(org-level-4 ((t (:foreground ,zenjazz-yellow-2))))
   `(org-level-5 ((t (:foreground ,zenjazz-cyan))))
   `(org-level-6 ((t (:foreground ,zenjazz-green+2))))
   `(org-level-7 ((t (:foreground ,zenjazz-red-4))))
   `(org-level-8 ((t (:foreground ,zenjazz-blue-4))))
   `(org-link ((t (:foreground ,zenjazz-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,zenjazz-green+4))))
   `(org-scheduled-previously ((t (:foreground ,zenjazz-red))))
   `(org-scheduled-today ((t (:foreground ,zenjazz-blue+1))))
   `(org-sexp-date ((t (:foreground ,zenjazz-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,zenjazz-green+2))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,zenjazz-orange))))
   `(org-todo ((t (:bold t :foreground ,zenjazz-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,zenjazz-red :weight bold :underline nil))))
   `(org-column ((t (:background ,zenjazz-bg-1))))
   `(org-column-title ((t (:background ,zenjazz-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,zenjazz-bg :background ,zenjazz-red-1))))
   `(org-ellipsis ((t (:foreground ,zenjazz-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,zenjazz-cyan :underline t))))
;;;;; outline
   `(outline-1 ((t (:foreground ,zenjazz-orange))))
   `(outline-2 ((t (:foreground ,zenjazz-green+4))))
   `(outline-3 ((t (:foreground ,zenjazz-blue-1))))
   `(outline-4 ((t (:foreground ,zenjazz-yellow-2))))
   `(outline-5 ((t (:foreground ,zenjazz-cyan))))
   `(outline-6 ((t (:foreground ,zenjazz-green+2))))
   `(outline-7 ((t (:foreground ,zenjazz-red-4))))
   `(outline-8 ((t (:foreground ,zenjazz-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,zenjazz-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,zenjazz-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,zenjazz-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,zenjazz-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,zenjazz-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,zenjazz-fg :background ,zenjazz-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,zenjazz-bg :background ,zenjazz-orange))))
   `(proof-error-face ((t (:foreground ,zenjazz-fg :background ,zenjazz-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,zenjazz-bg :background ,zenjazz-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,zenjazz-bg :background ,zenjazz-orange))))
   `(proof-locked-face ((t (:background ,zenjazz-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,zenjazz-bg :background ,zenjazz-orange))))
   `(proof-queue-face ((t (:background ,zenjazz-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,zenjazz-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zenjazz-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zenjazz-bg))))
   `(proof-warning-face ((t (:foreground ,zenjazz-bg :background ,zenjazz-yellow-1))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,zenjazz-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,zenjazz-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,zenjazz-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,zenjazz-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,zenjazz-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,zenjazz-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,zenjazz-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,zenjazz-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,zenjazz-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,zenjazz-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,zenjazz-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,zenjazz-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,zenjazz-blue))))
   `(rcirc-other-nick ((t (:foreground ,zenjazz-orange))))
   `(rcirc-bright-nick ((t (:foreground ,zenjazz-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,zenjazz-blue-2))))
   `(rcirc-server ((t (:foreground ,zenjazz-green))))
   `(rcirc-server-prefix ((t (:foreground ,zenjazz-green+1))))
   `(rcirc-timestamp ((t (:foreground ,zenjazz-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,zenjazz-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:bold t))))
   `(rcirc-prompt ((t (:foreground ,zenjazz-yellow :bold t))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:bold t))))
   `(rcirc-url ((t (:bold t))))
   `(rcirc-keyword ((t (:foreground ,zenjazz-yellow :bold t))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,zenjazz-green))))
   `(rpm-spec-doc-face ((t (:foreground ,zenjazz-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,zenjazz-red))))
   `(rpm-spec-macro-face ((t (:foreground ,zenjazz-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,zenjazz-red))))
   `(rpm-spec-package-face ((t (:foreground ,zenjazz-red))))
   `(rpm-spec-section-face ((t (:foreground ,zenjazz-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,zenjazz-blue))))
   `(rpm-spec-var-face ((t (:foreground ,zenjazz-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,zenjazz-orange))))
   `(rst-level-2-face ((t (:foreground ,zenjazz-green+1))))
   `(rst-level-3-face ((t (:foreground ,zenjazz-blue-1))))
   `(rst-level-4-face ((t (:foreground ,zenjazz-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,zenjazz-cyan))))
   `(rst-level-6-face ((t (:foreground ,zenjazz-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,zenjazz-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,zenjazz-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,zenjazz-red+1 :background ,zenjazz-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,zenjazz-bg+3 :weight bold))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,zenjazz-red+1 :background ,zenjazz-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,zenjazz-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,zenjazz-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,zenjazz-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-red)))
      (t
       (:underline ,zenjazz-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-orange)))
      (t
       (:underline ,zenjazz-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-yellow)))
      (t
       (:underline ,zenjazz-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zenjazz-green)))
      (t
       (:underline ,zenjazz-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,zenjazz-green+2))))
   `(speedbar-directory-face ((t (:foreground ,zenjazz-cyan))))
   `(speedbar-file-face ((t (:foreground ,zenjazz-fg))))
   `(speedbar-highlight-face ((t (:foreground ,zenjazz-bg :background ,zenjazz-green+2))))
   `(speedbar-selected-face ((t (:foreground ,zenjazz-red))))
   `(speedbar-separator-face ((t (:foreground ,zenjazz-bg :background ,zenjazz-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,zenjazz-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,zenjazz-fg
                                    :background ,zenjazz-bg))))
   `(tabbar-selected ((t (:foreground ,zenjazz-fg
                                      :background ,zenjazz-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,zenjazz-fg
                                        :background ,zenjazz-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,zenjazz-bg
                                       :background ,zenjazz-bg-1))))
   `(term-color-red ((t (:foreground ,zenjazz-red-2
                                       :background ,zenjazz-red-4))))
   `(term-color-green ((t (:foreground ,zenjazz-green
                                       :background ,zenjazz-green+2))))
   `(term-color-yellow ((t (:foreground ,zenjazz-orange
                                       :background ,zenjazz-yellow))))
   `(term-color-blue ((t (:foreground ,zenjazz-blue-1
                                      :background ,zenjazz-blue-4))))
   `(term-color-magenta ((t (:foreground ,zenjazz-magenta
                                         :background ,zenjazz-red))))
   `(term-color-cyan ((t (:foreground ,zenjazz-cyan
                                       :background ,zenjazz-blue))))
   `(term-color-white ((t (:foreground ,zenjazz-fg
                                       :background ,zenjazz-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,zenjazz-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,zenjazz-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,zenjazz-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,zenjazz-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,zenjazz-cyan))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,zenjazz-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,zenjazz-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,zenjazz-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,zenjazz-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,zenjazz-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,zenjazz-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,zenjazz-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,zenjazz-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,zenjazz-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,zenjazz-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,zenjazz-bg+1 :foreground ,zenjazz-bg+1))))
   `(whitespace-hspace ((t (:background ,zenjazz-bg+1 :foreground ,zenjazz-bg+1))))
   `(whitespace-tab ((t (:background ,zenjazz-red-1))))
   `(whitespace-newline ((t (:foreground ,zenjazz-bg+1))))
   `(whitespace-trailing ((t (:background ,zenjazz-red))))
   `(whitespace-line ((t (:background ,zenjazz-bg :foreground ,zenjazz-magenta))))
   `(whitespace-space-before-tab ((t (:background ,zenjazz-orange :foreground ,zenjazz-orange))))
   `(whitespace-indentation ((t (:background ,zenjazz-yellow :foreground ,zenjazz-red))))
   `(whitespace-empty ((t (:background ,zenjazz-yellow))))
   `(whitespace-space-after-tab ((t (:background ,zenjazz-yellow :foreground ,zenjazz-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,zenjazz-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,zenjazz-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,zenjazz-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,zenjazz-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,zenjazz-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,zenjazz-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,zenjazz-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,zenjazz-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,zenjazz-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,zenjazz-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,zenjazz-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,zenjazz-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,zenjazz-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,zenjazz-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,zenjazz-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,zenjazz-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,zenjazz-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,zenjazz-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,zenjazz-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,zenjazz-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,zenjazz-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,zenjazz-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,zenjazz-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,zenjazz-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,zenjazz-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,zenjazz-green+4))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,zenjazz-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,zenjazz-bg-1 :foreground ,zenjazz-bg-1))))
   ))

;;; Theme Variables
(zenjazz-with-color-variables
  (custom-theme-set-variables
   'zenjazz
;;;;; ansi-color
   `(ansi-color-names-vector [,zenjazz-bg ,zenjazz-red ,zenjazz-green ,zenjazz-yellow
                                          ,zenjazz-blue ,zenjazz-magenta ,zenjazz-cyan ,zenjazz-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,zenjazz-bg-05)
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,zenjazz-red-1)
       ( 40. . ,zenjazz-red)
       ( 60. . ,zenjazz-orange)
       ( 80. . ,zenjazz-yellow-2)
       (100. . ,zenjazz-yellow-1)
       (120. . ,zenjazz-yellow)
       (140. . ,zenjazz-green-1)
       (160. . ,zenjazz-green)
       (180. . ,zenjazz-green+1)
       (200. . ,zenjazz-green+2)
       (220. . ,zenjazz-green+3)
       (240. . ,zenjazz-green+4)
       (260. . ,zenjazz-cyan)
       (280. . ,zenjazz-blue-2)
       (300. . ,zenjazz-blue-1)
       (320. . ,zenjazz-blue)
       (340. . ,zenjazz-blue+1)
       (360. . ,zenjazz-magenta)))
   `(vc-annotate-very-old-color ,zenjazz-magenta)
   `(vc-annotate-background ,zenjazz-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar zenjazz-add-font-lock-keywords nil
  "Whether to add font-lock keywords for zenjazz color names.
In buffers visiting library `zenjazz-theme.el' the zenjazz
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar zenjazz-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after zenjazz activate)
;;   "Maybe also add font-lock keywords for zenjazz colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or zenjazz-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "zenjazz-theme.el")))
;;     (unless zenjazz-colors-font-lock-keywords
;;       (setq zenjazz-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car zenjazz-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc zenjazz-colors-alist))))))
;;     (font-lock-add-keywords nil zenjazz-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after zenjazz activate)
;;   "Also remove font-lock keywords for zenjazz colors."
;;   (font-lock-remove-keywords nil zenjazz-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'zenjazz)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; zenjazz-theme.el ends here
