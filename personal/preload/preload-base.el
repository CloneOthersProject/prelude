;显示行号
(global-linum-mode t)
;更改光标样式
(setq-default cursor-type 'bar)
;;设置字体
(set-default-font "Source Code Variable-16")

;;设置默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;去掉滚动时产生响声
(setq ring-bell-function 'ignore)

;; 禁止自动保存和备份
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

;; 内容有修改时自动更新文件
(global-auto-revert-mode t)


;; 设置默认字符集
(set-language-environment "UTF-8")

(provide 'preload-base)