(in-package #:music-ed)


(defparameter *qu1* "a")
(defparameter *qu2* "b")
(defparameter *qu3* "c")
(defparameter *qu4* "d")

(defparameter *progress* 0.0d0)

(defun set-answer-list ()
  (setf *qu1* (nth 0 *ans-list*))
  (setf *qu2* (nth 1 *ans-list*))
  (setf *qu3* (nth 2 *ans-list*))
  (setf *qu4* (nth 3 *ans-list*))
  )


(defun interval-questions (app)
;; Close the previous window
  (close-previous-window)
  ;;make a new window
  (question-template)
  (set-answer-list)
  (let ((intervalQs-win (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(grid (gir:invoke (*gtk* "Grid" 'new)))
;	(separator (gir:invoke (*gtk* "Separator" 'new)0))
	;;progress bar
	(progress-bar (gir:invoke (*gtk* "ProgressBar" 'new)))
	;;question buttons
	(q1 (gir:invoke (*gtk* "ToggleButton" 'new-with-label) *qu1* ))
	(q2 (gir:invoke (*gtk* "ToggleButton" 'new-with-label) *qu2* ))
	(q3 (gir:invoke (*gtk* "ToggleButton" 'new-with-label) *qu3* ))
	(q4 (gir:invoke (*gtk* "ToggleButton" 'new-with-label) *qu4* ))
	;;==========
	(play-button (gir:invoke (*gtk* "Button" 'new-with-label) "Play"))
	(question (gir:invoke (*gtk* "Label" 'new)*question-text*))
	)
    
    (setf (window-title intervalQs-win) "Inverval Questions")
    (setf (widget-size-request intervalQs-win) '(500 300))

    ;Quesiton
    (setf (gir:property question 'margin-top)20
	  (gir:property question 'margin-bottom)10
	  (gir:property question 'margin-start)10)

    ;play button

    (setf(gir:property play-button 'margin-end)100)
    
    ;progress bar
    (setf (gir:property progress-bar 'margin-top) 20)
    (setf (gir:property progress-bar 'margin-bottom) 20)

            ;; Set progress bar to be half complete
    (gir:invoke (progress-bar 'set-fraction) *progress*)


        ;; Group the Toggle buttons
    (gir:invoke (q1 'set-group) q1)
    (gir:invoke (q2 'set-group) q1)
    (gir:invoke (q3 'set-group) q1)
    (gir:invoke (q4 'set-group) q1)
    
    ;Button
    (gir:connect play-button :clicked
                 (lambda (button)
		   (declare (ignore button))
                   (test-play-mp3)))

      

    ;; Pack the buttons and label into the grid
    (gir:invoke (grid 'attach) question 0 0 3 1)
    (gir:invoke (grid 'attach) play-button 1 1 2 1)
    (gir:invoke (grid 'attach) progress-bar 0 2 4 1)
  ;  (gir:invoke (grid 'attach) separator 0 2 4 1)
    (gir:invoke (grid 'attach) q1 0 3 2 1)
    (gir:invoke (grid 'attach) q2 2 3 2 1)
    (gir:invoke (grid 'attach) q3 0 4 2 1)
    (gir:invoke (grid 'attach) q4 2 4 2 1)
    


   

;setting window
    (gir:invoke (intervalQs-win 'set-child) grid)
    (gir:invoke (intervalQs-win 'show))
    (setf *previous-window* intervalQs-win)))



(defun my-member (item lst)
     (cond 
       ((null item) nil)
       ((null lst) nil)
       (T
	(if (equal item (car lst)) lst (my-member item (cdr lst))))))


(defun my-remv-dups (lst)
     (cond
       ((null lst) nil)
       ((my-member (car lst) (cdr lst)) (my-remv-dups (cdr lst)))
       (T (cons (car lst) (my-remv-dups (cdr lst))))))
   


(defun My-list ()
     (setq qreservoir( my-remv-dups(loop :for i :in *my-data*
			    :collect(nth 1 i))))
     (setf question-list (alexandria:shuffle *my-data*))
     (setf *right-ans* (nth qnum (alexandria:iota (length question-list))))
     (setq qRans (nth 1 (nth *right-ans* question-list)))	   
     (setf qWans (remove qRans qreservoir :test #'equal))
  )


(defun question-template ()
    (setf *Q1* 0)
    (setf *my-data* (cdr(cl-csv:read-csv #P"questions/Question1.csv")))
    (My-list)
    (setf *Question-Text* (car (nth *right-ans* *my-data*)))
    (setf *ans-list* (alexandria:flatten(list qrans(loop :for i :below 3 :collect (nth i qwans)))))
    (alexandria:shuffle *ans-list*))


(defun Test-answer ()
    (setq *answer* (loop :for i :in *Q1*
		       :collect (setq *answer* (gtk-toggle-button-active i))
		       )
	)
    (setf *answer* (loop :for i :in *answer*
		       :for j :below 4
		       :do (if i (return j))))

    (if (= (position qrans *ans-list*) *answer* )
	(incf MScore)
	(format t "Sorry the right answer was ~a " qrans)
	))

