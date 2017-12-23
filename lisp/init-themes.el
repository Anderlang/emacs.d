;;----------------------
;;皮肤
;;----------------------
(use-package spacemacs-theme
  :ensure t
  )

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(spacemacs-dark)) ;;黑夜

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
 (dolist (theme custom-enabled-themes)
  (unless (custom-theme-p theme)
    (load-theme theme t)))
(custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(run-with-idle-timer 0.1 nil 'reapply-themes) ;; 启动后延迟执行
;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
 (interactive) ;;可公开调用light函数
  (setq custom-enabled-themes '(spacemacs-light))
 (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
 (setq custom-enabled-themes '(spacemacs-dark))
   (reapply-themes))

(provide 'init-themes)

;;; init-themes.el ends here
