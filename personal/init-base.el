;;使用hungry-delay
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'popwin)
(popwin-mode t)

;; 全局找文件
(require 'helm-ag)
(global-set-key (kbd "C-c q") 'helm-do-ag-project-root)

(require 'iedit)
(global-set-key (kbd "S-SPC e") 'iedit-mode)

;; 格式化json
(global-set-key (kbd "S-SPC f j") 'json-pretty-print-buffer)

;; 增强Copy功能
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

;; 设置copy当前行
(global-set-key (kbd "C-d") 'duplicate-line)

;;设置最近打开的文件
;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-items 30)
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

(setq hs-allow-nesting t)
(add-hook 'web-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'hs-minor-mode)
(add-hook 'css-mode-hook 'hs-minor-mode)
(add-hook 'scss-mode-hook 'hs-minor-mode)
(add-hook 'typescript-mode-hook 'hs-minor-mode)
(add-hook 'less-css-mode-hook 'hs-minor-mode)

(provide 'init-base)
