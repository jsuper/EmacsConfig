;; This is the common settings 
;; for different os , pls checkout the branch of your os type . eg. win7 -- windows, debian--linux



;;����һЩ���
(defconst my-config-home "EmacsConfig/" "�ҵ�emacs���������ļ���·��")
(defconst my-site-lisps  (concat my-config-home "my-site-lisps") "���Լ�д��emacs lisp����·��")
(defconst third-part-lisps  (concat my-config-home "third-party-lisps") "�����ص�emacs lisp����·��")
(defconst my-templates (concat my-config-home "my-templates") "�������е�ģ��")


;;��homeĿ¼�µ�.emacs.d��site-lisp���ص�Load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/site-lisp")

;;���ظ������ز����������ļ�
(load (concat my-site-lisps "/load-helper"))

;;���ص���������
(load-dir third-part-lisps)

;;�����ҵ�emacs �����ļ�
(add-to-list 'load-path (concat my-site-lisps "settings"))
(mapc 'load (directory-files (concat my-site-lisps "/settings") t "\\.el$"))