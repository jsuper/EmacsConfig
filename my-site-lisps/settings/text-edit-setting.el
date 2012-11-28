;;设置关于编辑的一些配置

;;定义REDO函数
(defmacro def-redo-command (fun-name redo undo)
  "Make redo command."
  `(defun ,fun-name ()
     (interactive)
     (if (equal last-command ,redo)
         (setq last-command 'undo)
       (setq last-command nil))
     (call-interactively ,undo)
     (setq this-command ,redo)))
(def-redo-command redo 'redo 'undo)

;;绑定ctrl z为 undo
(global-set-key (kbd "C-z") 'undo)

;;绑定cttl z z为 redo
(global-set-key (kbd "C-x C-z") 'redo)
