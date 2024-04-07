;;;; music-ed.asd

(asdf:defsystem #:music-ed
  :description "Describe music-ed here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-gtk4
	       #:cl-csv
	       #:alexandria
	       #:cl-mpg123
	       #:cl-out123
		)

  :components ((:file "package")
	       (:file "playtracks")
	       (:file "gcse-menu")
	       (:file "menu")
	       (:file "audio-player")
	       (:file "interval-questions")
               (:file "music-ed")
	       (:file "Score-menu")
	       (:module "questions")
	       )
  :build-operation "program-op"
  :build-pathname "Build-test-App2"
  :entry-point "music-ed::main"
  )
