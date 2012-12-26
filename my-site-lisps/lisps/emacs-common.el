;; this is my common functions
(defconst show-buffer-name "show-buffer-name" "the buffer name which display the result" )

(defun get-read-only-buffer (buffer-name)
  "Setting a buffer read only"
  (let ((tmp-buffer (get-buffer buffer-name))
	(current-buffer (current-buffer))
	)
    (when tmp-buffer
      ;;When the buffer exist, delete it
      (kill-buffer tmp-buffer)
      )
    (set-buffer 
     (get-buffer-create buffer-name))
    (setq buffer-read-only t)
    (set-buffer current-buffer) ;; swith to the buffer
    (get-buffer buffer-name) ;; return the created buffer
    ))
;;(create-and-show-buffer-in-window "demo")
(defun execute-command-and-show-result (command-str &optional args &reset infile)
  "This function will call extenal command 
   and show the result in the current window
   - args speificed the command execute args
   - infile specificed the input file
  "
  (get-read-only-buffer show-buffer-name)
  (setq result 
	(if args
	    (if infile
		(call-process command-str nil show-buffer-name nil args infile)
	      (call-process command-str nil show-buffer-name nil args))
	  (if infile
	       (call-process command-str infile show-buffer-name)
	    (call-process command-str nil show-buffer-name))))
  (pop-to-buffer show-buffer-name)
  (= result 0))


(provide 'emacs-common)
