                                        ;显示行号
(global-linum-mode t)
                                        ;更改光标样式
(setq-default cursor-type 'bar)
;;设置字体
 ;; (set-default-font "Source Code Variable-19" t t)
;;(set-default-font "Inconsolata-18" t t)
;; (set-default-font "Courier-18" t t)
(set-default-font "Consolas-16" t t)

;; (setq-default line-spacing 0.01)           ;设置行间距

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

;; 代码缩进设置
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (whitespace-cleanup)
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (whitespace-cleanup)
        (indent-buffer)
        (message "Indent buffer.")))))

;; 代码缩进设置快捷键
(global-set-key (kbd "S-SPC f i") 'indent-region-or-buffer)

;; 去掉多余空格
(global-set-key (kbd "S-SPC f SPC") 'whitespace-cleanup)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;给配制文件加快捷键
(global-set-key (kbd "<f4>") 'open-init-file)

;; '' 补全优化
;;(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;;(sp-local-pair 'lisp-mode "'" nil :actions nil)
;; 以上也可以这么干：(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)


;; 解决在代码块中让两边的括号都高亮起来
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

;; 解决在lisp-mode 下括号不高亮
(show-paren-mode t)

;; 在大括号内 Retrun 的时候，光标更智能放在对应的位置。
(electric-indent-mode t)
(electric-pair-mode t)

;; 删除dos系统中的  \r\M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
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

;; find-fcuntion find-variable find-function-on-key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;解决emacs ctrl-space与输入法冲突
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC SPC") 'set-mark-command)
(global-set-key (kbd "S-SPC n") 'make-frame-command)


;; 把下拉提示选项上下键改成 C-n 和 C-p
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 格式化json
(global-set-key (kbd "S-SPC f j") 'json-pretty-print-buffer)

(provide 'preload-base)
