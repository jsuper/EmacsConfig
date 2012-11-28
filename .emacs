;; This is the common settings 
;; for different os , pls checkout the branch of your os type . eg. win7 -- windows, debian--linux



;;定义一些常量
(defconst my-config-home "EmacsConfig/" "我的emacs相关配置文件的路径")
(defconst my-site-lisps  (concat my-config-home "my-site-lisps") "我自己写的emacs lisp包的路径")
(defconst third-part-lisps  (concat my-config-home "third-party-lisps") "我下载的emacs lisp包的路径")
(defconst my-templates (concat my-config-home "my-templates") "存放所有的模板")


;;将home目录下的.emacs.d和site-lisp加载到Load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/site-lisp")

;;加载辅助加载插件的配置文件
(load (concat my-site-lisps "/load-helper"))

;;加载第三方插件
(load-dir third-part-lisps)

;;加载我的emacs 配置文件
(add-to-list 'load-path (concat my-site-lisps "settings"))
(mapc 'load (directory-files (concat my-site-lisps "/settings") t "\\.el$"))