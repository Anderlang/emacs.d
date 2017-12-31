;; ----------------------
;; web开发及自动补全
;; ----------------------
(use-package web-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.tmpl\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    
    	 (setq web-mode-engines-alist
    	       '(("django"    . "\\.html\\'"))) ;;可以根据实际语言选择对应模板，如golang

	 (setq web-mode-ac-sources-alist
	       '(
		 ("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
		 ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
		 ("css" . (ac-source-css-property ac-source-emmet-css-snippets))
		 )
	       )
	 (add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
                   (yas-activate-extra-mode 'php-mode)
                 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil))
	       )))
	 (setq web-mode-enable-auto-closing t)
   	 (setq web-mode-enable-auto-quoting t)
   	 (setq web-mode-enable-current-element-highlight t);;高亮显示元素
	 )
(use-package emmet-mode
  :ensure t
  :bind(("M-n" . emmet-next-edit-point) ;;下一个编辑点
	("M-p" . emmet-prev-edit-point) ;;上一个编辑点
	)
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  
)

(provide 'init-web)
