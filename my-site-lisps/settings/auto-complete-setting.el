
;;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat my-templates "/auto-complete/ac-dict"))
(setq ac-auto-show-menu 0.5)
(ac-config-default)

(provide 'auto-complete-setting)
