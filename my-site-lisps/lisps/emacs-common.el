;; this is my common functions
(defconst show-buffer-name "show-buffer-name" "the buffer name which display the result" )

; This function is used to clear a buffer's content/
; when the buffer is read-only, it will set the target buffer
; writable then clear the buffer content.
(defun clear-buffer(buffer-name)
  "Clean the speficed buffer's content"
  (message "clear buffer content")
  (let ((tmp-buffer (get-buffer buffer-name))
	(current-buffer (current-buffer)))
    (when tmp-buffer
      
	;;if the tmp-buffer exist, clean the content
      (funcall (lambda (buffer)
		 (set-buffer buffer)
		 (let ((read-only-buffer buffer-read-only))
		   (when read-only-buffer
		     (setq buffer-read-only nil))
		   (erase-buffer)
		   (setq buffer-read-only read-only-buffer)
	    )) tmp-buffer))))


; This function will create a read-only buffer
; which name is 'buffer-name', if the buffer is 
; exist, then clear the buffer's content and return it.
(defun get-read-only-buffer (buffer-name)
  "Setting a buffer read only"
  (let ((tmp-buffer (get-buffer buffer-name))
	(current-buffer (current-buffer))
	)
    (if (bufferp tmp-buffer)
	;;if the buffer exist ,clear its content and return it
	(clear-buffer show-buffer-name)
      ;;if not exist, then create new one
      (funcall (lambda ()
	    (set-buffer 
	     (get-buffer-create buffer-name))
	    (setq buffer-read-only t)
	    (set-buffer current-buffer)))) ;; swith to the buffer
    (get-buffer buffer-name) ;; return the created buffer
    ))

; This function is used to execute the external command which can be found on system path.
; The excuted result will diplay on a read-only-buffer which name is 
; define on show-buffer-name
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

