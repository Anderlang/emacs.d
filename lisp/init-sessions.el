;;----------------------
;; 状态保持 
;;----------------------
(use-package session
  :ensure t)

(desktop-save-mode 1)
(setq-default history-length 1000)
(savehist-mode t)

(setq session-save-file (expand-file-name ".session" user-emacs-directory))
(setq session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)")


(provide 'init-sessions)
