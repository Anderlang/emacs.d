;;; package --- Summary
;;; Commentary:
;;; Code:
;; 使用elpa
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  ;;(add-to-list 'package-archives (cons "melpa" url) t))
(add-to-list 'package-archives   '("melpa-stable" . "https://stable.melpa.org/packages/") t)) ;;使用stable，避免一些包更新了一些没更新导致安装出错
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; 初始化

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(tool-bar-mode 0) ;;不要工具栏
(menu-bar-mode 0) ;;不要菜单栏
(scroll-bar-mode 0) ;;不要滚动条
(set-frame-parameter nil 'fullscreen 'fullboth) ;;全屏显示
(global-hl-line-mode 1) ;;高亮显示当前行
(setq inhibit-startup-message t) ;; 关闭启动界面
(fset 'yes-or-no-p 'y-or-n-p) ;;emacs 提示yes or no 时，只需輪入 y／n
(electric-pair-mode t) ;;自动补全括号
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-15")) ;;字体

(require 'init-themes) ;; 皮肤
(require 'init-window) ;;窗口操作
;;(require 'init-smex) ;;快速输入命令,使用helm代替
(require 'init-helm) ;;快速输入
(require 'init-auto-complete) ;;自动补全,和company相似
;;(require 'init-company);;自动补全，和auto-complete相似
(require 'init-web) ;;web开发
;;(require 'init-emmet) ;;提高前端开发效率,整合到init-web里
(require 'init-undo) ;;撤销
(require 'init-ido) ;;切换缓冲区和文件
(require 'init-expand);;增强选择
(require 'init-avy) ;;用于跳转到文件中任意的位置
(require 'init-iedit) ;;批量编辑
(require 'init-flycheck) ;;代码检查
(require 'init-go) ;;go语言
(require 'init-magit) ;;git版本管理
(require 'init-sessions);;状态保持
(require 'init-yasnippet) ;; 输入模板
(require 'init-youdao) ;;有道词典
(require 'init-which-key) ;;自动提示快捷键
(require 'init-export) ;; 导出
;;(require 'init-jump) ;;增强跳转


;;(load "dash-autoloads")
;;(load "session-autoloads")
;;(load "web-mode-autoloads")
;;(load "smex-autoloads")

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
;;(when (file-exists-p custom-file)
;;  (load custom-file))


;;(when (maybe-require-package 'uptimes)
;;  (add-hook 'after-init-hook (lambda () (require 'uptimes))))

;;----------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (company session magit uptimes go-autocomplete yasnippet-snippets yasnippet auto-complete ace-window smex web-mode dash pyim-wbdict pyim spacemacs-theme)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


(provide 'init)

;;; init.el ends here

