;;使用hungry-delay
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'popwin)
(popwin-mode t)

;; 全局找文件
(require 'helm-ag)
(global-set-key (kbd "S-SPC p f") 'helm-do-ag-project-root)

;;设置最近打开的文件
;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-items 30)
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

(provide 'init-base)
