;;;; music-ed.lisp

(in-package #:music-ed)


(defvar *gio* (gir:ffi "Gio"))
(defvar *gtk* (gir:ffi "Gtk" "4.0"))

(defvar *previous-window* nil)
(defparameter *icon-directory* "~/quicklisp/local-projects/music-ed/icons/48x48/icon.png")


;;main App
(defun main ()
  (let ((app (gir:invoke (*gtk* "Application" 'new)
                         "My.GTK4.Tests"
                         (gir:nget *gio* "ApplicationFlags" :default-flags))))
    ;(gir:invoke (app 'get-for-display) *icon-directory*)
    
    (gir:connect app :activate 'menu)
    (gir:invoke (app 'run) nil)))


;; Define a function to close the previous window
    (defun close-previous-window ()
      (when *previous-window*
        (gir:invoke (*previous-window* 'destroy))))


(defun debug-windows (win)
  (setf mscore 3)
  (setf qnum 3)
  (let ((app (gir:invoke (*gtk* "Application" 'new)
                         "My.GTK4.Tests"
                         (gir:nget *gio* "ApplicationFlags" :default-flags))))
    ;(gir:invoke (app 'get-for-display) *icon-directory*)
    
    (gir:connect app :activate win)
    (gir:invoke (app 'run) nil)))



