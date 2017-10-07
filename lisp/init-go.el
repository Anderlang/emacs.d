;;----------------------
;;go语言支持
;;----------------------

(use-package go-mode
  :ensure t ;;支持自动安装
  :init
  (add-hook 'before-save-hook 'gofmt-before-save t) ;;保存时自动格式化
 )

(require 'go-autocomplete) ;;代码提示，需安装go-autocomplete
(require 'auto-complete-config)
(ac-config-default)


(provide 'init-go)

;;; init-go.el ends here
