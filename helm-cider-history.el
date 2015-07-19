;;; helm-cider-history.el --- Show cider input history in helm

;; Copyright (C) 2015 Andreas Klein

;; Author: Andreas Klein <git@kungi.org>
;; URL: https://github.com/Kungi/helm-cider-history
;; Created: 19.07.2015
;; Keywords: convenience
;; Version: 0.0.1
;; Package-Requires: ((helm "1.4.0") (cider "0.9.0"))

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'helm)

(defvar helm-cider-history-candidates nil)

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

;;; helm-cider-history.el ends here
