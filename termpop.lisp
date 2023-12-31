;; Terminal pop, change with your favorite terminal emulator
(defun termpop ()
  "Divide window horizontally and launch vterm on the bottom window"
  (interactive)
  (let* ((default-directory (or (file-name-directory (buffer-file-name)) default-directory))
         (next-window (next-window))
         (next-buffer (window-buffer next-window))
         (next-buffer-major-mode (buffer-local-value 'major-mode next-buffer)))
    (if (eq next-buffer-major-mode 'vterm-mode)
        (progn
          (select-window next-window)
          (vterm-send-return))
      (progn
        (split-window-below)
        (other-window 1)
        (shrink-window 12)
        (vterm (generate-new-buffer-name "*vterm*"))
        (set-window-dedicated-p (selected-window) t)))))

(defun termpop-cleanup (process event)
  "Delete the window after exiting vterm"
  (delete-window))

(add-hook 'vterm-exit-functions 'termpop-cleanup)

(global-set-key (kbd "<f9>") 'termpop)
(global-set-key (kbd "C-c v") 'vterm-copy-mode)
