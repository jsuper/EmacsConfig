;;loading emacs-common
(require 'emacs-common)

;;this function is used to run python script
(defun execute-python-file()
  "Using this function to exectute the file on current buffer"
  (interactive)
  (let ((temp-file-name (buffer-file-name)))
    ;;when found the file extension is .py, then execute python file.py
    (when (string-match "^.*\\.py" temp-file-name)
      ;(message temp-file-name)
      (execute-command-and-show-result "python" temp-file-name)
      )
    )
  )

; binding some settings for python-mode
; to execute a python script, just hit F5
(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "<f5>") 'execute-python-file)))
