(window-list (window-frame (selected-window)))
(window-list)
(frame-list)
(window-parent (selected-window))

(defun get-root-window (&optional)
  "Using this method to get a root window of the specify window."

  )


(defun get-root-window (window)
  "Recursion get the window's root-window"
  (let ((tmp (window-parent window)))
    (if tmp
	(get-root-window tmp)
      (
	
  )

(frame-root-window)
(window-list)
(window-top-child (frame-root-window))
(window-left-child (frame-root-window))

(frame-first-window (selected-window))
(window-total-height (selected-window))
(window-resize (selected-window) 0.1)
(split-window (frame-root-window) nil 'right)

(x-popup-menu t (make-keymap "hello-worl"))
(make-keymap "demo")
(x-popup-dialog t "helo")
(make-sparse-keymap "demo")
(x-popup-menu t (make-sparse-keymap "demo"))
