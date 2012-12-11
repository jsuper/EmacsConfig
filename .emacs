;; This is the common settings 
;; for different os , pls checkout the branch of your os type . eg. win7 -- windows, debian--linux



;;define const
(defconst my-config-home "/home/commons/repositories/github/EmacsConfig/" "emacs home")
(defconst my-site-lisps  (concat my-config-home "my-site-lisps") "All lisps which i written")
(defconst third-part-lisps  (concat my-config-home "third-party-lisps") "third party lisps")
(defconst my-templates (concat my-config-home "my-templates") "templates")


;add default .emacs.d and site-lisp to load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/site-lisp")

;;load the load-helper
(load (concat my-site-lisps "/load-helper"))

;load all third-part lisps 
(load-dir third-part-lisps)

;;load my settings
(add-to-list 'load-path (concat my-site-lisps "settings"))
(mapc 'load (directory-files (concat my-site-lisps "/settings") t "\\.el$"))
