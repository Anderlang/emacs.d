;;----------------------
;;快速切换窗口
;;----------------------
;;; code:

(use-package ace-window
    :bind ("M-o" . ander/other-window)
    :init
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    (defun --count-frames ()
      "Return the number of visible frames"
      (let* ((frames (if (daemonp) (butlast (visible-frame-list) 1) (visible-frame-list))))
        (length frames)))
    (defun ander/other-window ()
      "Change the cursor's focus to another window"
      (interactive)
      (if (or (> (count-windows) 2) (> (--count-frames) 1))
          (let ((golden-ratio-state golden-ratio-mode))
            (when golden-ratio-state
              (golden-ratio-mode -1)
              (balance-windows))
            (ace-window 1)
            (when golden-ratio-state
              (golden-ratio-mode 1)
              (golden-ratio)))
        (progn
          (ace-window 0)
          (golden-ratio))))
    :config
    (setf aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(provide 'init-window)

;;; init-window.el ends here
