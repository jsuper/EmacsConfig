;;配置org-mode

(require 'htmlize)
(require 'org-install)
;;(org-babel-do-load-languages 'org-babel-load-languages '((c . t) (java . t) (emacs-lisp . t)))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
