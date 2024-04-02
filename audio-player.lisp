(in-package :music-ed)


(defparameter *last-play* nil)
(defvar *out* (make-instance 'cl-out123:output))

(defun play-mp3 (song)
  (if (bt:thread-alive-p *last-play*)
      (print "already playing")
      (let* ((file (cl-mpg123:make-file (parse-namestring(concatenate 'string "~/quicklisp/local-projects/music-ed/questions/" song ".mp3"))))
         (out (make-instance 'cl-out123:output))
         )
    (cl-mpg123:connect file)
    (cl-out123:connect out :driver "pulse")
    (cl-out123:start out)
    (setq *last-play*
	  (bt:make-thread
           (lambda ()
             (loop
               :while t ; Loop infinitely until thread is destroyed
               :do (let ((buffer (cl-mpg123:buffer file))
                         (bytes (cl-mpg123:process file)))
                     (if (= bytes 0)
                         (return)
                         (cl-out123:play-directly out buffer bytes)))
               (sleep 0.1))))) ; Add a short delay to reduce CPU load
    (values out *last-play*)))) ; Return the output and thread objects


(defun stop-mp3 ()
  (if (bt:thread-alive-p *last-play*)
      (bt:destroy-thread *last-play*))
  )


