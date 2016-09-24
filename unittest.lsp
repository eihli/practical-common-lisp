(= (+ 1 2) 3)
(= (+ 10 -5) 5)

(defun test-+ ()
  (and
   (= (+ 1 2) 3)
   (= (+ 10 -5) 5)
   (= (- 10 8) 2)))

(defun test-+ ()
  (format t "~:[FAIL~;pass~] ... ~a~%" (= (+ 1 2) 3) '(= (+ 1 2) 3))
  (format t "~:[FAIL~;pass~] ... ~a~%" (= (- 10 8) 3) '(= (- 10 8) 3)))

(defun report-result (result form)
  (format t "~:[FAIL~;pass~] ... ~a~%" result form))

(defun test-+ ()
  (report-result (= (+ 1 2) 3) '(= (+ 1 2) 3))
  (report-result (= (- 10 8) 3) '(= (- 10 8) 3)))
