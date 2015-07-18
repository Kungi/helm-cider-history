;; helm-cider-history


(defvar helm-cider-history-candidates
  nil)

(defun some-action (arg)
  (message-box "%s\n%s"
               (helm-get-selection)
               (helm-marked-candidates)))

(defun helm-cider-history ()
  (interactive)
  (setq helm-cider-history-candidates
        cider-repl-input-history)
  (helm :sources (helm-build-sync-source "Helm Cider History"
                   :candidates helm-cider-history-candidates
                   :action '(("Yank" . (lambda (candidate) (insert candidate))))
                   :persistent-action (lambda (candidate) (ignore))
                   :persistent-help "DoNothing"
                   :multiline t)
        :buffer "*helm cider history*"
        :resume 'noresume))

(provide 'helm-cider-history)
