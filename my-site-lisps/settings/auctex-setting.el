;;配置auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(if (string-equal system-type "windows-nt")
     (require 'tex-mik))

;;为了使用 auctex 方便，为 LaTeX 模式 hook 自动换行，数学公式，reftex 和显示行号的功能。
(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    ))

(setq preview-image-type 'pnm)



(add-hook 'LaTeX-mode-hook
          (lambda ()
			
            (setq TeX-auto-untabify t     ; remove all tabs before saving
			      TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
			(setq TeX-auto-save t)
			(setq TeX-parse-self t) 
			;;(setq-default TeX-master nil)
			(reftex-mode t)
			(TeX-fold-mode t)
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
