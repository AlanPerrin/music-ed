(in-package #:music-ed)

(defparameter CMS 0)
(defparameter *Opening-Menu* "Please Select your your current year of Study:")
(defvar MScore 0)
(defvar QNum 0)
(defparameter *Question-Text* "Here is some test text")
(defparameter *right-ans* nil )
(defparameter *wrong-ans* nil)
(defvar Question-list nil)
(defparameter *ans-list* nil)
(defparameter Mix-question-list nil)
(defparameter *Q1* 0)
(defparameter htQnA (make-hash-table))
(defparameter *my-data* nil )
(defparameter *answer* nil)
(defparameter my-mix nil)
(defparameter FTrack "~/quicklisp/local-projects/music-ed/questions/")
(defparameter Tcheck nil)
(defparameter *track* nil)
(defparameter qreservoir nil)
(defparameter qRans nil)
(defparameter qWans nil)

;; Define a function to play an MP3 track
(defparameter *mytest* "questions/Track-91.mp3")
(defun play-mp3 ()
  (print (parse-namestring (concatenate 'string ftrack "Track 91" ".mp3"))))


(defun M-server ()
    (org.shirakumo.fraf.harmony:maybe-start-simple-server)
    (incf cms))

(defun servercheck ()
    (if (= 0 CMS )
	(m-server)
	(print"server is running")))

(defun PlayTrack ()
    (servercheck)
    (setq *track*
	  (let ((x (car (last(nth *right-ans* *my-data*)))))
	    (org.shirakumo.fraf.harmony:play (parse-namestring (concatenate 'string ftrack x ".mp3")))
	    ))
    )

(defun Cstop ()
    (if *track*
	(mstop)
	(format t "first time playing"))
    )

(defun Mstop () 
     (setf tcheck (subseq(format nil "~a" *track*) 8 12))
    (if (equal tcheck "DONE")
	(print "track finished")
	(org.shirakumo.fraf.harmony:stop *track*))
  )

