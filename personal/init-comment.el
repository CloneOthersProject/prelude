;; 设置注释
(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg))

(global-set-key (kbd "C-c C-/") 'my-comment-or-uncomment-region)

(provide 'init-comment)
