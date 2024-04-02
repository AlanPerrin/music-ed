(in-package #:music-ed)


(defparameter *content* "test content")

(defun score-menu (app)
  (buildScore)
;; Close the previous window
  (close-previous-window)
;;make a new window
  (let ((score-window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	(win-text (gir:invoke (*gtk* "Label" 'new) *content*))
	(back (gir:invoke (*gtk* "Button" 'new-with-label) "Close"))
	(progress-bar (gir:invoke (*gtk* "ProgressBar" 'new)))
	)
    
    (setf (window-title score-window) "Your Score")
    (setf (widget-size-request score-window) '(200 200))



    ;margins

    (setf (gir:property win-text 'margin-top)20)
    (setf (gir:property progress-bar 'margin-top)20)
    (setf (gir:property back 'margin-top)10)

    
    (gir:connect back :clicked
                 (lambda (button)
		   (declare (ignore button))
                   (window-destroy score-window)))

    ;set progress bar
    (gir:invoke (progress-bar 'set-fraction) *progress*)



    
;boxing

    (box-append box win-text)
    (box-append box progress-bar)
    (box-append box back)

;setting window
    (gir:invoke (score-window 'set-child) box)
    (gir:invoke (score-window 'show))
    (setf *previous-window* score-window)))


(defun buildScore()
  (decf qnum)
  (setf *content* (format nil "Your score is ~a out of ~a" mscore qnum))
  (setf *progress* (+ *progress* (/ mscore qnum)))
  )
