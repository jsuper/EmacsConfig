;;配置org-mode

(require 'htmlize)
(require 'org-install)
(require 'org-publish)
;(require 'iimage)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;(defun org-toggle-iimage-in-org ()
;  "display images in your org file"
;  (interactive)
;  (if (face-underline-p 'org-link)
;      (set-face-underline-p 'org-link nil)
;      (set-face-underline-p 'org-link t))
;  (iimage-mode))

(defun force-publish-all ()
   "Force org-mode to publish all files"
   (interactive)
   (org-publish "note" t))



;;org-mode hook settings
(add-hook 'org-mode-hook
	  (lambda ()
	    (setq truncate-lines nil)
	    (local-set-key (kbd "C-c C-p") 'force-publish-all)
	    (global-set-key (kbd "<f8> p") 'org-publish-all)))

(setq org-publish-project-alist
	  '(
	    ("org-notes"
		 :base-directory "/home/commons/repositories/bitbucket/mynotes"
		 :publishing-directory "/home/commons/notes/publish"
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
		 :base-directory "/home/commons/repositories/bitbucket/mynotes/"
		 :publishing-directory "/home/commons/notes/publish"
		 :recursive t
		 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
		 :publishing-function org-publish-attachment)
		("note"
		 :components ("org-notes" "note-static")
		 :author "tangling.life@gmail.com"
		 )
		)
	    )
