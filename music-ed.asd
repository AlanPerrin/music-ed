;;;; music-ed.asd

(asdf:defsystem #:music-ed
  :description "Describe music-ed here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-gtk4)
  :components ((:file "package")
	       (:file "gcse-menu")
	       (:file "menu")
	       (:file "interval-questions")
               (:file "music-ed")))
