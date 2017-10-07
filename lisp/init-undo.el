;;----------------------
;;撤销操作
;;----------------------
(use-package undo-tree
:ensure t
  :init
  (global-undo-tree-mode))

(provide 'init-undo)
