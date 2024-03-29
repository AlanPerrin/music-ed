;;;; music-ed.lisp

(in-package #:music-ed)


(defvar *gio* (gir:ffi "Gio"))
(defvar *gtk* (gir:ffi "Gtk" "4.0"))

(defvar *previous-window* nil)



(defun main ()
  (let ((app (gir:invoke (*gtk* "Application" 'new)
                         "My.GTK4.Tests"
                         (gir:nget *gio* "ApplicationFlags" :default-flags))))
    (gir:connect app :activate 'menu)
    (gir:invoke (app 'run) nil)))
