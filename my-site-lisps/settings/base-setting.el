;;      基本配置   ;;;;;;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;;以Server 模式启动emacs
;;个人信息
(setq user-mail-address "ling.java@gmail.com")
(setq user-full-name "tony")

(setq-default default-directory "~")

(require 'server)
(or (server-running-p)
    (server-start))

;; 显示列号
(setq column-number-mode t)
;;显示行号
(linum-mode t)
;;标题栏显示buffer名字
(setq frame-title-format "emacs@%b")

;;关闭启动画面
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
;;自动打开和显示图片
(auto-image-file-mode)

;;不显示toolbar
;;(setq tool-bar-mode nil)
(tool-bar-mode -1)
;;不显示menubar
;;(menu-bar-mode nil)

;;语法亮亮
(global-font-lock-mode t)

;;显示与之匹配的括号
(show-paren-mode t)
(setq show-paren-style 'parenthess)

;;不产生备份文件
(setq make-backup-files nil)
;;启动最大化
;(setq initial-frame-alist '((top . 0) (left . 0) (width . 160) (height . 70)))
(run-with-idle-timer 0 nil 'w32-send-sys-command 61488)  

;;设置文件编码格式

;;设定语言环境为utf-8
(setq current-language-environment "UTF-8")
(setq default-input-method "chinese-py")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;使用Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; Emacs光标样式设置
;; http://emacser.com/cursor-change.htm
(require 'cursor-change)
(cursor-change-mode 1)


;; 在fringe上显示一个小箭头指示当前buffer的边界
(setq-default indicate-buffer-boundaries 'left)

;; 尽快显示按键序列
(setq echo-keystrokes 0.1)

(setq system-time-locale "C")

;; 不要滚动条
(customize-set-variable 'scroll-bar-mode nil)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq default-major-mode 'text-mode)

;; 不要总是没完没了的问yes or no, 为什么不能用y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; 不要闪烁光标, 烦不烦啊
(blink-cursor-mode -1)
;; 没有提示音,也不闪屏
(setq ring-bell-function 'ignore)


;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;; 先格式化再补全
(setq tab-always-indent 'complete)
