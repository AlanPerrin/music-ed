(in-package #:music-ed)



(defun interval-questions (app)
;; Close the previous window
  (close-previous-window)
;;make a new window
  (let ((intervalQs-win (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	(question (gir:invoke (*gtk* "Label" 'new)*question-text*))
	)
    
    (setf (window-title intervalQs-win) "Inverval Questions")
    (setf (widget-size-request intervalQs-win) '(500 500))

    ;Quesiton
    (setf (gir:property question 'margin-top)15)



;boxing
    (box-append box question)

;setting window
    (gir:invoke (intervalQs-win 'set-child) box)
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
    (setf *my-data* (cdr(cl-csv:read-csv #P"music-ed/questions/Question1.csv")))
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

