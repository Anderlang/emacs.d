;;; package --- init-python
;;; Commentary:
;;; python 配置文件
;;; Code:

(use-package elpy
  :ensure t
  :init
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "python3")
  (setq pyvenv-virtualenvwrapper-python "/usr/bin/python3")
  (elpy-enable)
  (when (require 'flycheck nil t)
      (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
      (add-hook 'elpy-mode-hook 'flycheck-mode))
 )


(provide 'init-python)

;;; init-python ends here
