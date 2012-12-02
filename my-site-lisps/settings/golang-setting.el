;;配置yaml-model
(require 'go-mode-load)
(require 'go-autocomplete)
(require 'auto-complete-config)
;;绑定 ctrl-x f shift f 为格式化代码
;(defun go-lang-settings ()
;  "Using this function to load go-mode"
;  (when (and (stringp buffer-file-name);
;	     (string-match "\\.go$" buffer-file-name));
;
;    (load (concat third-part-lisps "/golang/go-mode-load"))
;    (message "open a go file")
;  ))
;(add-hook 'find-file-hook 'go-lang-settings)
;(global-set-key (kbd "C-a") 'gofmt)

(defun go-lang-settings ()
  "Go Lang settings"
  ;;enable auto-complete-mode
  (auto-complete-mode t)
  ;;binding Ctrl+a to format the source code
  (global-set-key (kbd "C-a") 'gofmt)
)

(add-hook 'go-mode-hook 'go-lang-settings)
