;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

(setq-default indent-tabs-mode 't)
(setq-default tab-width 4)
(setq c-default-style "k&r")
(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq c-basic-offset 4)))

(add-hook 'python-mode-hook
		 '(lambda ()
			(setq indent-tabs-mode t)
			(setq indent-level 4)
			(setq python-indent 4)
			(setq tab-width 4)))

(load "~/.emacs-keybind.el")
(load "~/.emacs-japanese.el")

