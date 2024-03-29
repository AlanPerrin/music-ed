
(in-package #:music-ed)

(defun open-new-window (app)
;; Close the previous window
  (close-previous-window)
;;make a new window
  (let ((new-window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	(int-q (gir:invoke (*gtk* "Button" 'new-with-label) "interval questions"))
	)
    
    (setf (window-title new-window) "Inverval Questions")
    (setf (widget-size-request new-window) '(200 200))

    ;button

     (setf (gir:property int-q 'margin-top)74)

;boxing
    (box-append box int-q)

;setting window
    (gir:invoke (new-window 'set-child) box)
    (gir:invoke (new-window 'show))
    (setf *previous-window* new-window)))
