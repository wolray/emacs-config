(define-minor-mode number-mode
  :init-value t
  :global t
  :keymap (make-sparse-keymap)
  (set-cursor-color (if number-mode "#ffffff"
		      (highlight-symbol-next-color))))
(m-set-number 1 'c-sort-lines-or-paragraphs)
(m-set-number 2 'c-move-backward-line)
(m-set-number 3 'c-move-forward-line)
(m-set-number 4 (kbd "C-l"))
(m-set-number 5 (kbd "C-x C-s"))
(m-set-number 6 (kbd "M-^"))
(m-set-number 7 'c-paragraph-backward)
(m-set-number 8 'c-move-up)
(m-set-number 9 'c-move-down)
(m-set-number 0 'c-paragraph-forward)

(define-minor-mode visual-mode
  :init-value nil
  :keymap (make-sparse-keymap)
  (if (not visual-mode) (setq cursor-type 'bar)
    (setq cursor-type 'box)
    (define-key visual-mode-map (kbd "Y") (key-binding (kbd "M-g C-S-y")))
    (define-key visual-mode-map (kbd "e") (key-binding (kbd "C-y")))
    (define-key visual-mode-map (kbd "h") (key-binding (kbd "M-h")))
    (define-key visual-mode-map (kbd "m") (key-binding (kbd "C-m")))
    (define-key visual-mode-map (kbd "y") (key-binding (kbd "M-g C-y")))
    ))
(define-key visual-mode-map (kbd "i") 'c-toggle-visual-mode)
(define-key visual-mode-map (kbd "r") 'other-window)

(global-set-key (kbd "C-<return>") nil)
(global-set-key (kbd "C-a") nil)
(global-set-key (kbd "C-c C-c") 'eval-buffer)
(global-set-key (kbd "C-e") nil)
(global-set-key (kbd "C-p") nil)
(global-set-key (kbd "C-q") nil)
(global-set-key (kbd "C-r") 'other-window)
(global-set-key (kbd "C-t") nil)
(global-set-key (kbd "C-v") nil)
(global-set-key (kbd "C-w") nil)
(global-set-key (kbd "C-z") nil)
(m-map-key 'backward-kill-paragraph (kbd "C-n"))
(m-map-key 'backward-up-list (kbd "C-S-i"))
(m-map-key 'bs-show (kbd "C-b"))
(m-map-key 'bs-show (kbd "M-b"))
(m-map-key 'c-backward-kill-line (kbd "M-DEL"))
(m-map-key 'c-clear-shell (kbd "C-c c"))
(m-map-key 'c-copy-buffer (kbd "C-x C-x"))
(m-map-key 'c-cua-rectangle-mark-mode (kbd "C-1"))
(m-map-key 'c-cycle-paren-shapes (kbd "C-c i"))
(m-map-key 'c-cycle-search-whitespace-regexp (kbd "C-M-s"))
(m-map-key 'c-dired (kbd "C-x C-d"))
(m-map-key 'c-highlight-symbol (kbd "M-i"))
(m-map-key 'c-highlight-symbol-query-replace (kbd "M-q"))
(m-map-key 'c-indent-paragraph (kbd "C-c C-i"))
(m-map-key 'c-kill-region (kbd "C-d"))
(m-map-key 'c-kill-region (kbd "M-d"))
(m-map-key 'c-kill-ring-save (kbd "C-M-w"))
(m-map-key 'c-kill-ring-save (kbd "C-w"))
(m-map-key 'c-kill-ring-save (kbd "M-w"))
(m-map-key 'c-kmacro-cycle-ring-next (kbd "M-="))
(m-map-key 'c-kmacro-cycle-ring-previous (kbd "M--"))
(m-map-key 'c-kmacro-end-or-call-macro (kbd "C-="))
(m-map-key 'c-kmacro-start-macro (kbd "C--"))
(m-map-key 'c-page-down (kbd "M-]"))
(m-map-key 'c-page-up (kbd "M-p"))
(m-map-key 'c-query-replace (kbd "C-q"))
(m-map-key 'c-query-replace-regexp (kbd "M-q"))
(m-map-key 'c-revert-buffer (kbd "C-<backspace>"))
(m-map-key 'c-set-or-exchange-mark (kbd "C-S-f"))
(m-map-key 'c-set-or-exchange-mark (kbd "C-f"))
(m-map-key 'c-set-or-exchange-mark (kbd "M-f"))
(m-map-key 'c-switch-to-scratch (kbd "C-x s"))
(m-map-key 'c-toggle-comment (kbd "C-t"))
(m-map-key 'c-toggle-comment (kbd "M-t"))
(m-map-key 'c-toggle-frame (kbd "<f12>"))
(m-map-key 'c-toggle-number-mode (kbd "`"))
(m-map-key 'c-toggle-page (kbd "M-["))
(m-map-key 'c-transpose-lines-down (kbd "M-9"))
(m-map-key 'c-transpose-lines-up (kbd "M-8"))
(m-map-key 'c-transpose-paragraphs-down (kbd "M-0"))
(m-map-key 'c-transpose-paragraphs-up (kbd "M-7"))
(m-map-key 'c-word-capitalize (kbd "M-U"))
(m-map-key 'c-word-downcase (kbd "M-I"))
(m-map-key 'c-word-upcase (kbd "M-O"))
(m-map-key 'comment-kill (kbd "M-'"))
(m-map-key 'delete-pair (kbd "C-S-d"))
(m-map-key 'eval-last-sexp (kbd "C-y"))
(m-map-key 'eval-region (kbd "C-S-y"))
(m-map-key 'highlight-symbol-next (kbd "M-o"))
(m-map-key 'highlight-symbol-prev (kbd "M-u"))
(m-map-key 'hippie-expand (kbd "C-."))
(m-map-key 'kill-this-buffer (kbd "M-k"))
(m-map-key 'linum-mode (kbd "<f9>"))
(m-map-key 'magit-status (kbd "C-x g"))
(m-map-key 'shrink-window (kbd "C-M-<up>"))
(m-map-key 'toggle-truncate-lines (kbd "<f10>"))
(m-map-key (kbd "<left>") (kbd "C-j"))
(m-map-key (kbd "<right>") (kbd "C-l"))
(m-map-key (kbd "C-/") (kbd "C-,"))
(m-map-key (kbd "C-/") (kbd "C-z"))
(m-map-key (kbd "C-/") (kbd "M-,"))
(m-map-key (kbd "C-/") (kbd "M-z"))
(m-map-key (kbd "C-<left>") (kbd "C-u"))
(m-map-key (kbd "C-<right>") (kbd "C-o"))
(m-map-key (kbd "C-M-b") (kbd "C-S-u"))
(m-map-key (kbd "C-M-f") (kbd "C-S-o"))
(m-map-key (kbd "C-M-i") (kbd "C-M-."))
(m-map-key (kbd "C-M-i") (kbd "M-."))
(m-map-key (kbd "C-M-o") (kbd "C-v"))
(m-map-key (kbd "C-M-o") (kbd "M-v"))
(m-map-key (kbd "C-M-s") (kbd "M-s"))
(m-map-key (kbd "C-c C-b") (kbd "C-c C-b"))
(m-map-key (kbd "C-c C-e") (kbd "C-c C-e"))
(m-map-key (kbd "C-c C-f") (kbd "C-c C-f"))
(m-map-key (kbd "C-c C-k") (kbd "C-c C-k"))
(m-map-key (kbd "C-c C-r") (kbd "C-c C-r"))
(m-map-key (kbd "C-c C-t") (kbd "C-c C-t"))
(m-map-key (kbd "C-c C-v") (kbd "C-c C-v"))
(m-map-key (kbd "C-c C-w") (kbd "C-c C-w"))
(m-map-key (kbd "C-c C-y") (kbd "C-c C-y"))
(m-map-key (kbd "C-c C-z") (kbd "C-c C-z"))
(m-map-key (kbd "C-g") (kbd "C-g"))
(m-map-key (kbd "C-g") (kbd "C-h C-g"))
(m-map-key (kbd "C-g") (kbd "M-g"))
(m-map-key (kbd "C-h c") (kbd "C-h C-c"))
(m-map-key (kbd "C-h f") (kbd "C-h C-f"))
(m-map-key (kbd "C-h v") (kbd "C-h C-v"))
(m-map-key (kbd "C-h w") (kbd "C-h C-w"))
(m-map-key (kbd "C-k") (kbd "C-a"))
(m-map-key (kbd "C-s") (kbd "C-s"))
(m-map-key (kbd "C-x 0") (kbd "C-x 0"))
(m-map-key (kbd "C-x 1") (kbd "C-x 1"))
(m-map-key (kbd "C-x 2") (kbd "C-x 2"))
(m-map-key (kbd "C-x 3") (kbd "C-x 3"))
(m-map-key (kbd "C-x <left>") (kbd "C-M-j"))
(m-map-key (kbd "C-x <left>") (kbd "M-j"))
(m-map-key (kbd "C-x <right>") (kbd "C-M-l"))
(m-map-key (kbd "C-x <right>") (kbd "M-l"))
(m-map-key (kbd "C-x C-0") (kbd "C-x C-t"))
(m-map-key (kbd "C-x C-c") (kbd "C-x c"))
(m-map-key (kbd "C-x C-e") (kbd "C-x C-e"))
(m-map-key (kbd "C-x C-f") (kbd "C-x C-f"))
(m-map-key (kbd "C-x C-k C-d") (kbd "M-DEL"))
(m-map-key (kbd "C-x C-k RET") (kbd "C-\\"))
(m-map-key (kbd "C-x C-o") (kbd "C-M-\\"))
(m-map-key (kbd "C-x C-q") (kbd "C-x C-q"))
(m-map-key (kbd "C-x C-r") (kbd "C-x C-r"))
(m-map-key (kbd "C-x C-s") (kbd "<f5>"))
(m-map-key (kbd "C-x C-u") (kbd "C-x C-u"))
(m-map-key (kbd "C-x C-w") (kbd "C-x C-w"))
(m-map-key (kbd "C-x C-z") (kbd "C-x C-c"))
(m-map-key (kbd "C-x C-z") (kbd "C-x C-z"))
(m-map-key (kbd "C-x ^") (kbd "C-M-<down>"))
(m-map-key (kbd "C-x h") (kbd "C-x C-h"))
(m-map-key (kbd "C-x o") (kbd "C-M-r"))
(m-map-key (kbd "C-x o") (kbd "M-r"))
(m-map-key (kbd "C-x z") (kbd "C-x z"))
(m-map-key (kbd "C-x {") (kbd "C-M-<left>"))
(m-map-key (kbd "C-x }") (kbd "C-M-<right>"))
(m-map-key (kbd "C-y") (kbd "C-e"))
(m-map-key (kbd "C-y") (kbd "M-e"))
(m-map-key (kbd "DEL") (kbd "C-S-k"))
(m-map-key (kbd "DEL") (kbd "C-k"))
(m-map-key (kbd "M-<") (kbd "C-x C-8"))
(m-map-key (kbd "M->") (kbd "C-x C-9"))
(m-map-key (kbd "M-g M-I") (kbd "C-M-S-i"))
(m-map-key (kbd "M-g M-O") (kbd "C-M-S-o"))
(m-map-key (kbd "M-g M-U") (kbd "C-M-S-u"))
(m-map-key (kbd "M-g M-d") (kbd "C-M-d"))
(m-map-key (kbd "M-g M-i") (kbd "C-M-i"))
(m-map-key (kbd "M-g M-k") (kbd "C-M-k"))
(m-map-key (kbd "M-g M-o") (kbd "C-M-o"))
(m-map-key (kbd "M-g M-q") (kbd "C-M-q"))
(m-map-key (kbd "M-g M-u") (kbd "C-M-u"))
(m-map-key (kbd "RET") (kbd "M-m"))
(m-map-key (kbd "`") (kbd "C-`"))
(m-map-key nil (kbd "C-"))
(m-map-key nil (kbd "C-'"))
(m-map-key nil (kbd "C-;"))
(m-map-key nil (kbd "C-<tab>"))
(m-map-key nil (kbd "C->"))
(m-map-key nil (kbd "C-M-/"))
(m-map-key nil (kbd "C-M-;"))
(m-map-key nil (kbd "C-M-<backspace>"))
(m-map-key nil (kbd "C-M-S-j"))
(m-map-key nil (kbd "C-M-S-k"))
(m-map-key nil (kbd "C-M-S-l"))
(m-map-key nil (kbd "C-M-a"))
(m-map-key nil (kbd "C-M-b"))
(m-map-key nil (kbd "C-M-c"))
(m-map-key nil (kbd "C-M-h"))
(m-map-key nil (kbd "C-M-n"))
(m-map-key nil (kbd "C-M-p"))
(m-map-key nil (kbd "C-M-t"))
(m-map-key nil (kbd "C-M-x"))
(m-map-key nil (kbd "C-M-y"))
(m-map-key nil (kbd "C-S-j"))
(m-map-key nil (kbd "C-S-k"))
(m-map-key nil (kbd "C-S-l"))
(m-map-key nil (kbd "C-S-n"))
(m-map-key nil (kbd "C-SPC"))
(m-map-key nil (kbd "C-]"))
(m-map-key nil (kbd "C-c C-o"))
(m-map-key nil (kbd "C-c C-u"))
(m-map-key nil (kbd "C-p"))
(m-map-key nil (kbd "C-x C--"))
(m-map-key nil (kbd "C-x C-="))
(m-map-key nil (kbd "C-x C-\\"))
(m-map-key nil (kbd "C-x C-]"))
(m-map-key nil (kbd "C-x C-a"))
(m-map-key nil (kbd "C-x C-b"))
(m-map-key nil (kbd "C-x C-i"))
(m-map-key nil (kbd "C-x C-k"))
(m-map-key nil (kbd "C-x C-o"))
(m-map-key nil (kbd "C-x C-p"))
(m-map-key nil (kbd "C-x C-u"))
(m-map-key nil (kbd "C-x C-v"))
(m-map-key nil (kbd "C-x DEL"))
(m-map-key nil (kbd "C-x \\"))
(m-map-key nil (kbd "C-x a"))
(m-map-key nil (kbd "C-x b"))
(m-map-key nil (kbd "C-x i"))
(m-map-key nil (kbd "C-x k"))
(m-map-key nil (kbd "C-x o"))
(m-map-key nil (kbd "C-x q"))
(m-map-key nil (kbd "C-x t"))
(m-map-key nil (kbd "C-x u"))
(m-map-key nil (kbd "C-{"))
(m-map-key nil (kbd "C-|"))
(m-map-key nil (kbd "C-}"))
(m-map-key nil (kbd "M-/"))
(m-map-key nil (kbd "M-<"))
(m-map-key nil (kbd "M->"))
(m-map-key nil (kbd "M-?"))
(m-map-key nil (kbd "M-H"))
(m-map-key nil (kbd "M-N"))
(m-map-key nil (kbd "M-Y"))
(m-map-key nil (kbd "M-\""))
(m-map-key nil (kbd "M-a"))
(m-map-key nil (kbd "M-c"))
(m-map-key nil (kbd "M-h"))
(m-map-key nil (kbd "M-n"))
(m-map-key nil (kbd "M-y"))
(m-map-key nil (kbd "M-{"))
(m-map-key nil (kbd "M-}"))
