(in-package #:music-ed)

(defun menu (app)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(GCSE (gir:invoke (*gtk* "Button" 'new-with-label) "GCSE"))
	(ALEVEL (gir:invoke (*gtk* "Button" 'new-with-label) "A Level"))
	(label (gir:invoke (*gtk* "Label"  'new) "Please select what level of music you are studying"))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	)
;window
    (setf(window-title window)"Main Menu")
    (setf (widget-size-request window ) '(500 300))
;; Define a function to close the previous window
    (defun close-previous-window ()
      (when *previous-window*
        (gir:invoke (*previous-window* 'destroy))))
    

    ;; Define function to handle opening new window
    (defun handle-open-new-window (button)
      (declare (ignore button))
      (open-new-window app))
    ;; Connect button signals
    (gir:connect GCSE :clicked #'handle-open-new-window)


    (gir:connect ALEVEL :clicked
                 (lambda (button)
		   (declare (ignore button))
                   (print "A Level")))

    
    
;label
    (setf (gir:property label 'margin-top)74)
    
;packing 

    (box-append box label)
    (box-append box GCSE)
    (box-append box ALEVEL)
    ;Add the box to window
    (gir:invoke (window 'set-child) box)
    ;;show the window
    (gir:invoke (window 'show))
    (setf *previous-window* window)))
