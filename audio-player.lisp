(in-package :music-ed)



;; Function to open the file chooser dialog


(defvar *file* (cl-mpg123:make-file #p"~/tester.mp3"))
(defvar *out* (make-instance 'cl-out123:output))
(cl-out123:play *out* *file*)

(setf (cl-mpg123:volume *file*) 0.5)

(defun play-mp3 (file-path)
  (let ((output (make-instance 'cl-out123:output)))
    (cl-out123:connect output :driver "alsa")
    (cl-out123:start output :rate 44100 :channels 2 :encoding :int16)
    (with-open-file (mp3-file file-path :element-type '(unsigned-byte 8))
      (let ((buffer (make-array 1024 :element-type '(unsigned-byte 8))))
        (loop for bytes-read = (read-sequence buffer mp3-file)
              while (> bytes-read 0)
              do (cl-out123:play output buffer bytes-read))))
    (cl-out123:stop output)
    (cl-out123:disconnect output)))


(defun Test-play-mp3 ()
  (defvar *file* (cl-mpg123:make-file #p"~/tester.mp3"))
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

(defun test-play-mp3 ()
  (let ((file-path "~/tester.mp3")
        (file (cl-mpg123:make-file file-path))
        (output (make-instance 'cl-out123:output)))
    (cl-mpg123:connect file)
    (cl-out123:connect output :driver "pulse")
    (cl-out123:start output)
    (loop :for buffer = (cl-mpg123:buffer file)
          :for bytes = (cl-mpg123:process file)
          :until (= bytes 0)
          :do (cl-out123:play output buffer bytes))
    (cl-mpg123:disconnect file)
    (cl-out123:stop output)
    (cl-out123:disconnect output)))
