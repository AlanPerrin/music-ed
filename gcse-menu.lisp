
(in-package #:music-ed)

(defun gcse-menu (app)
;; Close the previous window
 ; (close-previous-window)
;;make a new window
  (let ((new-window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	(int-q (gir:invoke (*gtk* "Button" 'new-with-label) "interval questions"))
	(back (gir:invoke (*gtk* "Button" 'new-with-label) "Back"))
	)
    
    (setf (window-title new-window) "GCSE Menu")
    (setf (widget-size-request new-window) '(200 200))

    ;button
    (setf (gir:property int-q 'margin-top)74)

        ;; Define function to handle opening new window
    (defun int-q-win (button)
      (declare (ignore button))
      (interval-questions app))
    ;; Connect button signals
    (gir:connect int-q :clicked #'int-q-win)

    (gir:connect back :clicked
                 (lambda (button)
		   (declare (ignore button))
                   (window-destroy new-window)))

;boxing
    (box-append box int-q)
    (box-append box back)

;setting window
    (gir:invoke (new-window 'set-child) box)
    (gir:invoke (new-window 'show))
    (setf *previous-window* new-window)))
