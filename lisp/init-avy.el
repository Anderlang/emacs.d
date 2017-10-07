;;----------------------
;;用于跳转到文件中任意的位置
;;----------------------
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char)
  )

(provide 'init-avy)
