(defun primep (number)
  (when (> number 1)
    (loop for factorial from 2 to (isqrt number) never (zerop (mod number factorial)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))

(do ((p (next-prime 0) (next-prime (1+ p))))
    ((> p 19))
  (format t "~d " p))

(defmacro do-primes (var-and-range &rest body)
  (let ((var (first var-and-range))
	(start (second var-and-range))
	(end (third var-and-range)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
	 ((> ,var ,end))
       ,@body)))

(defmacro do-primes-1 ((var start end) &body body)
  `(do ((,var (next-prime ,start) (next-prime(1+ ,var))))
       ((> ,var ,end))
     ,@body))

(do-primes-1 (p 0 99) (format t "~d " p))

(defmacro do-primes-2 ((var start end) &body body)
  (let ((ending-value-name (gensym)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
	  (,ending-value-name ,end))
	 ((> ,var ,ending-value-name))
       ,@body)))

(do-primes-2 (p 10 99) (format t "~d " p))

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(defmacro do-primes ((var start end) &body body)
  (with-gensyms (ending-value-name)
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
	  (,ending-value-name ,end))
      ((> ,var ,ending-value-name))
      ,@body)))

