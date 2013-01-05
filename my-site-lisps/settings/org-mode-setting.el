;;配置org-mode

(require 'htmlize)
(require 'org-install)
;;(org-babel-do-load-languages 'org-babel-load-languages '((c . t) (java . t) (emacs-lisp . t)))
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
