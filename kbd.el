(define-minor-mode visual-mode
  nil nil nil
  :keymap (make-sparse-keymap)
  (setq cursor-type (if visual-mode 'box 'bar)))
(let ((map visual-mode-map))
  (define-key map (kbd ",") 'C-M-b)
  (define-key map (kbd ".") 'C-M-f)
  (define-key map (kbd "0") 'C-<down>)
  (define-key map (kbd "1") 'delete-indentation)
  (define-key map (kbd "2") 'c-cycle-left-line)
  (define-key map (kbd "3") 'c-cycle-right-line)
  (define-key map (kbd "4") 'recenter-top-bottom)
  (define-key map (kbd "5") 'c-toggle-comment)
  (define-key map (kbd "6") 'c-switch-to-scratch)
  (define-key map (kbd "7") 'C-<up>)
  (define-key map (kbd "8") '<up>)
  (define-key map (kbd "9") '<down>)
  (define-key map (kbd "SPC 0") nil)
  (define-key map (kbd "SPC 1") 'delete-other-windows)
  (define-key map (kbd "SPC 2") 'split-window-below)
  (define-key map (kbd "SPC 3") 'split-window-horizontally)
  (define-key map (kbd "SPC 4") 'delete-window)
  (define-key map (kbd "SPC 5") 'winner-undo)
  (define-key map (kbd "SPC 7") nil)
  (define-key map (kbd "SPC 8") 'beginning-of-buffer)
  (define-key map (kbd "SPC 9") 'end-of-buffer)
  (define-key map (kbd "SPC SPC") 'self-insert-command)
  (define-key map (kbd "SPC a") 'c-clear-shell)
  (define-key map (kbd "SPC b") 'c-byte-compile)
  (define-key map (kbd "SPC c") 'c-revert-buffer)
  (define-key map (kbd "SPC d") 'c-dired)
  (define-key map (kbd "SPC e") 'mark-whole-buffer)
  (define-key map (kbd "SPC f") 'find-file)
  (define-key map (kbd "SPC g") 'C-g)
  (define-key map (kbd "SPC q") 'c-reload-current-mode)
  (define-key map (kbd "SPC r") 'c-rename-file-and-buffer)
  (define-key map (kbd "SPC s") 'save-buffer)
  (define-key map (kbd "SPC t") 'symbol-overlay-remove-all)
  (define-key map (kbd "SPC v") 'magit-status)
  (define-key map (kbd "SPC w") 'write-file)
  (define-key map (kbd "SPC x") 'c-copy-buffer)
  (define-key map (kbd "SPC z") nil)
  (define-key map (kbd "\\") 'C-c+C-q)
  (define-key map (kbd "a") 'C-k)
  (define-key map (kbd "b") 'bs-show)
  (define-key map (kbd "d") 'c-kill-region)
  (define-key map (kbd "e") 'exchange-point-and-mark)
  (define-key map (kbd "f") 'c-set-or-exchange-mark)
  (define-key map (kbd "g") 'C-g)
  (define-key map (kbd "i") 'visual-mode-off)
  (define-key map (kbd "j") '<left>)
  (define-key map (kbd "k") 'DEL)
  (define-key map (kbd "l") '<right>)
  (define-key map (kbd "m") 'RET)
  (define-key map (kbd "n") 'C-/)
  (define-key map (kbd "o") 'C-<right>)
  (define-key map (kbd "p") 'c-kmacro-end-or-call-macro)
  (define-key map (kbd "q") 'c-query-replace)
  (define-key map (kbd "r") 'other-window)
  (define-key map (kbd "s") 'c-isearch-forward)
  (define-key map (kbd "t") 'symbol-overlay-put)
  (define-key map (kbd "u") 'C-<left>)
  (define-key map (kbd "v") 'split-line)
  (define-key map (kbd "w") 'c-kill-ring-save)
  (define-key map (kbd "x") 'c-open-folder)
  (define-key map (kbd "y") 'C-y)
  (define-key map (kbd "z") nil)
  )

(defmacro kommand (func &optional sexp@0 sexp@1)
  (let ((ks (subst-char-in-string ?+ ? (symbol-name func))))
    `(defun ,func ()
       (interactive)
       (let ((cmd (key-binding (kbd ,ks))))
	 ,sexp@0
	 (when (commandp cmd) (call-interactively cmd))
	 ,sexp@1))))
(kommand <down>)
(kommand <left>)
(kommand <right>)
(kommand <up>)
(kommand C-/)
(kommand C-<down> (or (use-region-p) (push-mark)))
(kommand C-<left>)
(kommand C-<right>)
(kommand C-<up> (or (use-region-p) (push-mark)))
(kommand C-M-b)
(kommand C-M-f)
(kommand C-c+C-c)
(kommand C-c+C-h (C-c+C-h@0))
(kommand C-c+C-q nil (and (bolp) (f-skip-chars)))
(kommand C-c+C-y)
(kommand C-c+C-z)
(kommand C-g)
(kommand C-k)
(kommand C-y)
(kommand DEL)
(kommand RET)
(kommand TAB)

(defmacro kontrol (func)
  (let ((pfx (substring (symbol-name func) -1)))
    `(progn
       (define-key visual-mode-map (kbd ,pfx) ',func)
       (defun ,func ()
	 (interactive)
	 (let ((k (read-key-sequence nil)) ks cmd)
	   (unless (stringp k) (C-g))
	   (setq ks (concat "C-" ,pfx " " k)
		 cmd (key-binding (kbd ks)))
	   (if (commandp cmd) (call-interactively cmd)
	     (message "No command")))))))
(kontrol kontrol-c)
(kontrol kontrol-h)

(defmacro magik (key obj)
  `(let* ((ks (cadr ',key)) (mk (kbd (concat "M-g " ks))))
     (define-key key-translation-map
       ,key (if (symbolp ,obj) (progn (global-set-key mk ,obj) mk) ,obj))))
(magik (kbd "<f10>") 'toggle-truncate-lines)
(magik (kbd "<f12>") 'c-toggle-frame)
(magik (kbd "<f1>") 'visual-mode-toggle)
(magik (kbd "<f4>") 'read-only-mode)
(magik (kbd "<f5>") 'save-buffer)
(magik (kbd "<f8>") 'auto-complete-mode)
(magik (kbd "<f9>") 'nlinum-mode)
(magik (kbd "<tab>") 'c-tab)
(magik (kbd "M-'") 'comment-kill)
(magik (kbd "M-,") nil)
(magik (kbd "M-.") nil)
(magik (kbd "M-0") 'c-transpose-paragraphs-down)
(magik (kbd "M-7") 'c-transpose-paragraphs-up)
(magik (kbd "M-8") 'c-transpose-lines-up)
(magik (kbd "M-9") 'c-transpose-lines-down)
(magik (kbd "M-e") (kbd "M-:"))
(magik (kbd "M-g") (kbd "C-g"))
(magik (kbd "M-h") nil)
(magik (kbd "M-i") 'c-word-downcase)
(magik (kbd "M-j") nil)
(magik (kbd "M-k") nil)
(magik (kbd "M-l") nil)
(magik (kbd "M-m") nil)
(magik (kbd "M-n") (kbd "C-M-i"))
(magik (kbd "M-o") 'c-word-upcase)
(magik (kbd "M-p") nil)
(magik (kbd "M-q") (kbd "C-M-%"))
(magik (kbd "M-r") nil)
(magik (kbd "M-s") (kbd "C-M-s"))
(magik (kbd "M-u") 'c-word-capitalize)
(magik (kbd "M-y") nil)
(magik (kbd "TAB") 'c-tab)

(defun C-c+C-h@0 ()
  (unless (region-active-p)
    (beginning-of-line)
    (push-mark (point-max) t)))

(defun visual-mode-off ()
  (interactive)
  (visual-mode 0))

(defun visual-mode-on ()
  (interactive)
  (visual-mode))
(add-hook 'emacs-startup-hook 'visual-mode-on)
(add-hook 'find-file-hook 'visual-mode-on)

(defun visual-mode-toggle ()
  (interactive)
  (visual-mode 0)
  (if (eq (key-binding (kbd "<apps>")) 'visual-mode-on)
      (local-set-key (kbd "<apps>") nil)
    (local-set-key (kbd "<apps>") 'visual-mode-on)
    (visual-mode)))

(defun visual-mode-update ()
  (if visual-mode
      (or w32-apps-modifier (setq w32-apps-modifier 'hyper))
    (and w32-apps-modifier (setq w32-apps-modifier nil))))
(add-hook 'post-command-hook 'visual-mode-update)

(global-set-key (kbd "<apps>") 'visual-mode-on)
(global-set-key (kbd "C-c 8") 'yacua-delete)
(global-set-key (kbd "C-c 9") 'yacua-insert)
(global-set-key (kbd "C-c C-c") 'eval-buffer)
(global-set-key (kbd "C-c C-h") 'eval-region)
(global-set-key (kbd "C-c C-q") 'c-indent-paragraph)
(global-set-key (kbd "C-c C-y") 'eval-last-sexp)
(global-set-key (kbd "C-c \\") 'kmacro-delete-ring-head)
(global-set-key (kbd "C-c c") 'C-c+C-c)
(global-set-key (kbd "C-c g") 'C-g)
(global-set-key (kbd "C-c h") 'C-c+C-h)
(global-set-key (kbd "C-c i") 'c-sort-text)
(global-set-key (kbd "C-c p") 'c-kmacro-start-macro)
(global-set-key (kbd "C-c y") 'C-c+C-y)
(global-set-key (kbd "C-c z") 'C-c+C-z)
(global-set-key (kbd "C-h g") 'C-g)

(global-set-key (kbd "H-,") 'backward-up-list)
(global-set-key (kbd "H--") 'c-insert-arrow-1)
(global-set-key (kbd "H-.") 'up-list)
(global-set-key (kbd "H-8") 'symbol-overlay-jump-prev)
(global-set-key (kbd "H-9") 'symbol-overlay-jump-next)
(global-set-key (kbd "H-<backspace>") 'c-kill-buffer-other-window)
(global-set-key (kbd "H-<down>") 'enlarge-window)
(global-set-key (kbd "H-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "H-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "H-<up>") 'shrink-window)
(global-set-key (kbd "H-=") 'c-insert-arrow-2)
(global-set-key (kbd "H-SPC") 'C-g)
(global-set-key (kbd "H-[")'kmacro-cycle-ring-previous)
(global-set-key (kbd "H-\\") 'kmacro-edit-macro)
(global-set-key (kbd "H-]")'kmacro-cycle-ring-next)
(global-set-key (kbd "H-h") 'c-marker-echo-overlay)
(global-set-key (kbd "H-i") 'symbol-overlay-mode)
(global-set-key (kbd "H-j") 'c-switch-to-prev-buffer)
(global-set-key (kbd "H-k") 'kill-this-buffer)
(global-set-key (kbd "H-l") 'c-switch-to-next-buffer)
(global-set-key (kbd "H-m") 'c-delete-pair)
(global-set-key (kbd "H-n") 'hippie-expand)
(global-set-key (kbd "H-o") 'symbol-overlay-switch-forward)
(global-set-key (kbd "H-p") 'kmacro-view-macro)
(global-set-key (kbd "H-u") 'symbol-overlay-switch-backward)
(global-set-key (kbd "H-y") 'c-marker-set-overlay)

(let ((map isearch-mode-map))
  (define-key map (kbd "H-SPC") 'c-isearch-done)
  (define-key map (kbd "H-\\") 'isearch-query-replace)
  (define-key map (kbd "H-i") 'c-isearch-yank)
  (define-key map (kbd "H-o") 'isearch-repeat-forward)
  (define-key map (kbd "H-p") 'isearch-query-replace-regexp)
  (define-key map (kbd "H-u") 'isearch-repeat-backward)
  )

(let ((map minibuffer-local-map))
  (define-key map (kbd "H-\\") 'c-each)
  (define-key map (kbd "H-p") 'c-incf)
  )

(let ((map query-replace-map))
  (define-key map (kbd ".") 'exit)
  (define-key map (kbd "4") 'recenter)
  (define-key map (kbd "h") 'automatic)
  (define-key map (kbd "r") 'backup)
  )

(require 'symbol-overlay)
(let ((map (make-sparse-keymap)))
  (define-key map (kbd "e") 'symbol-overlay-echo-mark)
  (define-key map (kbd "i") 'symbol-overlay-put)
  (define-key map (kbd "o") 'symbol-overlay-jump-next)
  (define-key map (kbd "p") 'symbol-overlay-rename)
  (define-key map (kbd "q") 'symbol-overlay-query-replace)
  (define-key map (kbd "t") 'symbol-overlay-toggle-in-scope)
  (define-key map (kbd "u") 'symbol-overlay-jump-prev)
  (define-key map (kbd "w") 'symbol-overlay-save-symbol)
  (define-key map (kbd "y") 'symbol-overlay-jump-to-definition)
  (setq symbol-overlay-map map))

(require 'yacua)

(with-eval-after-load 'auto-complete
  (let ((map ac-completing-map))
    (define-key map (kbd ",") 'ac-previous)
    (define-key map (kbd ".") 'ac-next)
    (define-key map (kbd "M-g <tab>") 'ac-expand)
    (define-key map (kbd "M-g TAB") 'ac-expand)
    ))

(with-eval-after-load 'bs
  (let ((map bs-mode-map))
    (define-key map (kbd "+") nil)
    (define-key map (kbd "-") 'bs-set-current-buffer-to-show-never)
    (define-key map (kbd "=") 'bs-set-current-buffer-to-show-always)
    (define-key map (kbd "C") nil)
    (define-key map (kbd "M") nil)
    (define-key map (kbd "S") nil)
    (define-key map (kbd "[") 'bs-up)
    (define-key map (kbd "]") 'bs-down)
    (define-key map (kbd "b") nil)
    (define-key map (kbd "f") nil)
    (define-key map (kbd "i") 'bs-select)
    (define-key map (kbd "k") nil)
    (define-key map (kbd "n") nil)
    (define-key map (kbd "o") 'bs-down)
    (define-key map (kbd "p") nil)
    (define-key map (kbd "r") 'bs-select-other-window)
    (define-key map (kbd "t") nil)
    (define-key map (kbd "u") 'bs-up)
    (define-key map (kbd "~") nil)
    ))

(with-eval-after-load 'cc-mode
  (let ((map java-mode-map))
    (define-key map (kbd ";") nil)
    (define-key map (kbd ",") nil)
    ))

(with-eval-after-load 'dired
  (let ((map dired-mode-map))
    (define-key map (kbd "SPC") 'dired-unmark)
    (define-key map (kbd "k") 'dired-unmark-backward)
    (define-key map (kbd "n") nil)
    (define-key map (kbd "o") 'dired-next-line)
    (define-key map (kbd "p") nil)
    (define-key map (kbd "r") 'dired-find-file-other-window)
    (define-key map (kbd "u") 'dired-previous-line)
    ))

(with-eval-after-load 'ess-mode
  (let ((map ess-mode-map))
    (define-key map (kbd "C-c C-c") 'ess-eval-buffer)
    (define-key map (kbd "C-c C-h") 'ess-eval-region)
    (define-key map (kbd "C-c C-y") 'ess-eval-line)
    (define-key map (kbd "_") nil)
    ))

(with-eval-after-load 'ess-r-post-run
  (let ((map ess-r-post-run-map))
    (define-key map (kbd "_") nil)
    ))

(with-eval-after-load 'haskell-mode
  (let ((map haskell-mode-map))
    (define-key map (kbd "C-c C-c") 'c-haskell-load-module)
    (define-key map (kbd "C-c C-z") 'switch-to-haskell)
    )
  (let ((map haskell-indentation-mode-map))
    (define-key map (kbd ",") nil)
    (define-key map (kbd ";") nil)
    ))

(with-eval-after-load 'magit-mode
  (let ((map magit-mode-map))
    (define-key map (kbd "4") 'recenter-top-bottom)
    (define-key map (kbd "[") 'magit-section-backward)
    (define-key map (kbd "]") 'magit-section-forward)
    (define-key map (kbd "n") nil)
    (define-key map (kbd "p") nil)
    ))

(with-eval-after-load 'matlab
  (let ((map matlab-mode-map))
    (define-key map (kbd "C-c C-q") nil)
    ))

(with-eval-after-load 'org
  (let ((map org-mode-map))
    (define-key map (kbd "C-c RET") 'org-open-at-point)
    (define-key map (kbd "C-c d") 'org-toggle-link-display)
    (define-key map (kbd "C-c e") 'org-edit-special)
    (define-key map (kbd "C-c s") 'org-sort)
    (define-key map (kbd "C-c t") 'org-table-toggle-coordinate-overlays)
    ))

(with-eval-after-load 'package
  (let ((map package-menu-mode-map))
    (define-key map (kbd "[") 'previous-line)
    (define-key map (kbd "]") 'next-line)
    (define-key map (kbd "n") nil)
    (define-key map (kbd "p") nil)
    ))

(with-eval-after-load 'python
  (let ((map python-mode-map))
    (define-key map (kbd "C-c C-h") 'python-shell-send-region)
    (define-key map (kbd "C-c C-y") 'c-python-shell-send-line)
    (define-key map (kbd "C-c r") 'run-python)
    ))

(with-eval-after-load 'racket-mode
  (let ((map racket-mode-map))
    (define-key map (kbd "C-c C-c") 'c-racket-send-buffer)
    (define-key map (kbd "C-c C-y") 'racket-send-last-sexp)
    ))

(with-eval-after-load 'with-editor
  (let ((map with-editor-mode-map))
    (define-key map (kbd "C-c k") 'with-editor-cancel)
    ))
