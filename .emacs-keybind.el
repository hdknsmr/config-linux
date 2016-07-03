;;
;; define functions
;;

(defun insert-line () 
  (interactive)
  (beginning-of-line)
  (open-line 1)
)

(defun backspace-to-beginning-of-line ()
  (interactive "*")
  (set-mark-command nil)
  (beginning-of-line)
  (kill-region (region-beginning) (region-end))
)

(defun previous-window-line (n)
  (interactive "p")
  (let ((cur-col
         (- (current-column)
            (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion (- n))
    (move-to-column (+ (current-column) cur-col))))

(defun next-window-line (n)
  (interactive "p")
  (let ((cur-col
         (- (current-column)
            (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion n)
    (move-to-column (+ (current-column) cur-col))))

(defun mew-smail ()
  (interactive)
  (require 'mew)
  (mew-send))
;;
;;
;;  Key binding
;;

;(load "egg-keymap")

(global-set-key "\C-n" 'next-window-line)
(global-set-key "\C-p" 'previous-window-line)
(global-set-key "\C-cb" 'boil)
(global-set-key "\M-\C-H" 'help-for-help)
(global-set-key "\^H" 'delete-backward-char)
(global-set-key "\C-xm" 'mh-smail)
(global-set-key "\C-cm" 'mh-rmail)
(global-set-key "\C-cd" 'online-dictionary)
(global-set-key "\C-z" 'scroll-down)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-o" 'insert-line)
;(global-set-key "\C-u" 'backspace-to-beginning-of-line)
(global-set-key "\C-u" 'undo)
(global-set-key "\C-t" 'kill-word)
(global-set-key "\M-$" 'replace-string)
;(global-set-key "\C-j" 'backward-word)
(global-set-key "\C-cw" 'w3)
;(global-set-key "\C-l" 'forward-word)
;(global-set-key "\C-x\C-m" 'compile)
(global-set-key "\C-x\C-n" 'next-error)
(global-set-key "\C-c\C-n" 'next-error)
(global-set-key "\C-c\C-c" 'compile)
(add-hook 'c-mode-hook
		  '(lambda ()
			 (define-key c-mode-map "\C-c\C-c" 'compile)))
(add-hook 'c++-mode-hook
		  '(lambda ()
			 (define-key c++-mode-map "\C-c\C-c" 'compile)))

(cond ((boundp 'NEMACS) (defrule "nn" "ん"))
;                       (global-set-key "\C-h" 'backward-delete-char)
;                        (global-set-key "\M-?" 'help-for-help)
      ((boundp 'MULE) (setq enable-double-n-syntax t)))
;(define-key fence-mode-map "\C-h" 'fence-backward-delete-char)


;;;
;;; Private Dictionary
;;;

;;(setusrdic "my-dict.usr" 5 t)


;;
;;  end of file
;;
