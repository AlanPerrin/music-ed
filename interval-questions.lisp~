(in-package #:music-ed)

(defparameter *Question* "This is a test question")


(defun interval-questions (app)
;; Close the previous window
  (close-previous-window)
;;make a new window
  (let ((intervalQs-win (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	(question (gir:invoke (*gtk* "Label" 'new)*Question*))
	)
    
    (setf (window-title intervalQs-win) "Inverval Questions")
    (setf (widget-size-request intervalQs-win) '(200 200))

    ;Quesiton
    (setf (gir:property question 'margin-top)15)



;boxing
    (box-append box question)

;setting window
    (gir:invoke (intervalQs-win 'set-child) box)
    (gir:invoke (intervalQs-win 'show))
    (setf *previous-window* intervalQs-win)))
