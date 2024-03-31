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
(defparameter *mytest*  (format nil "~aquestions/Track 91.mp3" (uiop:getcwd)))


;; Play the MP3 file




