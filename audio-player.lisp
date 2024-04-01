(in-package :music-ed)



;; Function to open the file chooser dialog


;(defvar *file* (cl-mpg123:make-file #p"~/tester.mp3"))
;(defvar *out* (make-instance 'cl-out123:output))
;(cl-out123:play *out* *file*)


(defvar *out* (make-instance 'cl-out123:output))

(defun play-mp3 (song)
  (let* ((file (cl-mpg123:make-file (parse-namestring(concatenate 'string "~/quicklisp/local-projects/music-ed/questions/" song ".mp3"))))
         (out (make-instance 'cl-out123:output))
        ; (buffer-size 4096)  ; Adjust buffer size as needed
         (playing t))
    (cl-mpg123:connect file)
    (cl-out123:connect out :driver "pulse")
    (cl-out123:start out)
    (bt:make-thread
     (lambda ()
       (loop
         :while playing
         :do (let ((buffer (cl-mpg123:buffer file))
                   (bytes (cl-mpg123:process file)))
               (if (= bytes 0)
                   (setq playing nil)
                   (cl-out123:play-directly out buffer bytes)))
	 )))
    ))




(defun PlayTrack (song)
  (setq *track* (concatenate 'string *mypath* song))
  )

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
