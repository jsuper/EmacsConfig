
(require 'cursor-chg)
 
(defgroup cursor-change nil
  "Group for cursor-change."
  :group 'cursor
  :prefix "cursor-change-")
 
(defvar cursor-change-old-cursor-type nil "Cursor type before toggle on function `cursor-change-mode'.")
(defvar cursor-change-old-blink-cursor-mode nil "`blink-cursor-mode' before toggle on function `crsor-change-mode'.")
 
(setq curchg-default-cursor-color "green")
 
;;;###autoload
(define-minor-mode cursor-change-mode
  "Toggle `cursor-change-mode'."
  :global t
  :group 'cursor-change
  (if cursor-change-mode
      (progn
        (setq cursor-change-old-cursor-type (cursor-change-get-cursor-type))
        (setq cursor-change-old-blink-cursor-mode blink-cursor-mode))
    (blink-cursor-mode (if cursor-change-old-blink-cursor-mode 1 -1)))
  (toggle-cursor-type-when-idle cursor-change-mode)
  (change-cursor-mode cursor-change-mode)
  (unless cursor-change-mode
    (curchg-set-cursor-type cursor-change-old-cursor-type)))
 
(defun cursor-change-get-cursor-type (&optional frame)
  "Get cursor type of frame FRAME."
  (cdr (assq 'cursor-type (frame-parameters frame))))
 
(defun curchg-change-cursor-on-overwrite/read-only ()
  "Set cursor type differently for overwrite mode, function `view-mode', and read-only buffer.
That is, use one cursor type for overwrite mode and read-only buffers,
and another cursor type otherwise."
  (curchg-set-cursor-type
   (if (or buffer-read-only overwrite-mode view-mode)
       curchg-overwrite/read-only-cursor-type
     curchg-default-cursor-type)))
 
(provide 'cursor-change)
 
;;; cursor-change.el ends here