;; ----------------------
;; web开发及自动补全
;; ----------------------
(use-package web-mode
    :ensure t
    :config
	 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	 (setq web-mode-engines-alist
	       '(("django"    . "\\.html\\'"))) ;;可以根据实际语言选择对应模板，如golang
	 (setq web-mode-ac-sources-alist
	       '(("css" . (ac-source-css-property))
		 ("html" . (ac-source-words-in-buffer
			    ac-source-html-tag))))
	 (setq web-mode-enable-auto-closing t)
	 (setq web-mode-enable-auto-quoting t)) ;

(use-package emmet-mode
:ensure t
:config
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
)

(use-package ac-html
  :ensure t)


(defun setup-ac-for-html ()
  ;; 默认的数据提供
  (require 'ac-html-default-data-provider)
  ;; Enable data providers,
  ;; currently only default data provider available
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;; 开始设置
  (ac-html-setup)
  ;; 自动补全来源
  (setq ac-sources '(ac-source-html-tag
                     ac-source-html-attr
                     ac-source-html-attrv))
  ;; 启动自动补全
  (auto-complete-mode t))

(add-hook 'html-mode-hook 'setup-ac-for-html)


(provide 'init-web)
