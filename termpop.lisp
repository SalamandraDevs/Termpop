;; Terminal pop, change with your favorite terminal emulator
(defun termpop ()
  "Divide window horizontally and lauch vterm on the bottom window"
  (interactive)
  (let* ((default-directory (or (file-name-directory (buffer-file-name)) default-directory))
         (next-buffer (window-buffer (next-window)))
         (next-buffer-major-mode (buffer-local-value 'major-mode next-buffer)))
    (if (eq next-buffer-major-mode 'vterm-mode)
        (progn
          (select-window (next-window))
          (vterm-send-return))
      (progn
        (split-window-below)
        (other-window 1)
        (shrink-window 12)
        (vterm (generate-new-buffer-name "*vterm*"))))))

(global-set-key (kbd "<f9>") 'term-pop)
