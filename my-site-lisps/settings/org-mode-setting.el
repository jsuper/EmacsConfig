;;配置org-mode

(require 'htmlize)
(require 'org-install)
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))


;;org-mode hook settings
(add-hook 'org-mode-hook
	  (lambda ()
	    (setq truncate-lines nil)
	    (global-set-key (kbd "<f8> p") 'org-publish)))

(setq org-publish-project-alist
	  '(
	    ("org-notes"
	     :base-directory "C:/Work/repositories/bitbucket/mynotes/notes"
	     :publishing-directory "C:/Work/repositories/bitbucket/mynotes/publish"
	     :base-extension "org"
	     :recursive t
	     :publishing-function org-publish-org-to-html
             :auto-sitemap t
	     :sitemap-filename "sitemap.org"
	     :sitemap-title "Sitemap"
	     :section-numbers nil
	     :style "<link rel=\"stylesheet\" href=\"./org-style.css\" type=\"text/css\"/>"
	     )
	    ("note-static"
	     :base-directory "C:/Work/repositories/bitbucket/mynotes/notes"
	     :publishing-directory "C:/Work/repositories/bitbucket/mynotes/publish"
	     :recursive t
	     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
	     :publishing-function org-publish-attachment)
	    ("note"
	     :components ("org-notes" "note-static")
	     :author "tangling.life@gmail.com"
	     )
	    )
	  )
