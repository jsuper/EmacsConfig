;;辅助加载文件
;;将指定目录之下的所有目录都加载到load-path,减少编写(add-to-list)

;;判断指定路径是否存在，同时，指定的路径必须是一个目录
(defun is-dir (path-of-file)
  "Judging the specified path is a directory or not, if true, return the path of this directory, otherwise return nil"
  (and
   (file-exists-p path-of-file)
   (file-directory-p path-of-file)
   (directory-file-name path-of-file)
   ))

;;判断指定路径下,是否存在以.el或者.elc文件
(defun exist-el-or-elc-files (dir-path)
  "Judging the specified directory is exist *.el or *.elc file"
  (and 
   (is-dir dir-path)
   (catch 'break
     (dolist (file (directory-files dir-path))
       (if (and
	    (not (is-dir file))
	    (string-match "^.*\\.\\(el\\|elc\\)$" file))
	   (throw 'break 0))))))

;;递归将指定路径下，所有包含.el或者.elc的文件的目录都加载到load-path中
(defun load-dir(path-of-dir)
  "Load the specified path to 'load-path"
  (interactive "p")
  (if (exist-el-or-elc-files path-of-dir)
      (add-to-list 'load-path path-of-dir))
  (when (is-dir path-of-dir)
    (dolist (temp-file (directory-files path-of-dir))
      (when (and
	     (not (string-match "^\\..*" temp-file))
	     (is-dir (concat path-of-dir "/" temp-file)))
	(load-dir (concat path-of-dir "/" temp-file))))))

(provide 'load-helper)
