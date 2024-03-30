;;;; music-ed.asd

(asdf:defsystem #:music-ed
  :description "Describe music-ed here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-gtk4
	       #:cl-csv
	      ; #:cl-mpg123
	       #:alexandria
	       #:harmony)

  :components ((:file "package")
	       (:file "playtracks")
	       (:file "gcse-menu")
	       (:file "menu")
	       (:file "interval-questions")
               (:file "music-ed")
	       (:module "questions")
	;	:components
	;	((:file "question1.csv")))
	       ))
