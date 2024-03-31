(in-package :music-ed)



;; Function to open the file chooser dialog


;(defvar *file* (cl-mpg123:make-file #p"~/tester.mp3"))
;(defvar *out* (make-instance 'cl-out123:output))
;(cl-out123:play *out* *file*)

;(setf (cl-mpg123:volume *file*) 0.5)

(defparameter *track* nil)
(defun my-cwd(x)
  (let ((cwd (format nil "~aquestions/" (uiop:getcwd))))
    (setf *track* (concatenate 'string cwd x ".mp3"))
    (defvar *file* (cl-mpg123:make-file  *track*))
    ))
	  
(defvar *file* (cl-mpg123:make-file #p"~/quicklisp/local-projects/music-ed/questions/Track 92.mp3"))
;(defvar *file* (cl-mpg123:make-file (parse-namestring *track*)))

(defvar *out* (make-instance 'cl-out123:output))

(defun Test-play-mp3 ()
;  (defvar *file* (cl-mpg123:make-file #p"~/Track 91.mp3"))
 ; (defvar *out* (make-instance 'cl-out123:output))
  (cl-mpg123:connect *file*) 
  (cl-out123:connect *out* :driver "pulse")
  (cl-out123:start *out*)
  (loop
    :for buffer = (cl-mpg123:buffer *file*)
    :for bytes = (cl-mpg123:process *file*)
    :until (= bytes 0)
    :do (cl-out123:play *out* buffer bytes)(incf *progress* 0.1d0))
    (cl-mpg123:disconnect *file*)
    (cl-out123:stop *out*)
  (cl-out123:disconnect *out*))

(defun PlayTrack ()
  (setq *track*
	 (let ((x (car (last(nth *right-ans* *my-data*)))))
	     (concatenate 'string ftrack x ".mp3"))
    ))
(defun MyTest-play-mp3 ()
  (playtrack)
  (defvar *file* (cl-mpg123:make-file (parse-namestring *track*)))
  (defvar *out* (make-instance 'cl-out123:output))
  (cl-mpg123:connect *file*) 
  (cl-out123:connect *out* :driver "pulse")
  (cl-out123:start *out*)
  (loop
    :for buffer = (cl-mpg123:buffer *file*)
      for bytes = (cl-mpg123:process *file*)
      until (= bytes 0)
      do (cl-out123:play *out* buffer bytes))
    (cl-mpg123:disconnect *file*)
    (cl-out123:stop *out*)
    (cl-out123:disconnect *out*))
