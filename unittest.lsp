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
  (format t "~:[FAIL~;pass~] ... ~a~%" result form)
  result)

(defun test-+ ()
  (report-result (= (+ 1 2) 3) '(= (+ 1 2) 3))
  (report-result (= (- 10 8) 3) '(= (- 10 8) 3)))

(defmacro check (form)
  `(report-result ,form ',form))

(check (= (+ 1 2) 3))

(defun test-+ ()
  (check (= (+ 1 2) 3))
  (check (= (- 10 8) 2)))

(defmacro check (&body forms)
  `(combine-results
     ,@(loop for f in forms collect `(report-result ,f ',f))))

;; (let ((result t))
;;   (unless (foo) (setf result nil))
;;   (unless (bar) (setf result nil))
;;   (unless (baz) (setf result nil)))

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(defmacro combine-results (&rest rest)
  (with-gensyms (result)
    `(let ((,result t))
       ,@(loop for test in rest
	    collect `(unless ,test (setf ,result nil)))
       ,result)))

(defmacro combine-results (&body forms)
  (with-gensyms (result)
    `(let ((,result t))
       ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
       ,result)))

(combine-results
 (= (+ 1 2) 3)
 (= (+ 10 5) 14))
