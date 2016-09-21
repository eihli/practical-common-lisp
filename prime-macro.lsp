(defun primep (number)
  (when (> number 1)
    (loop for factorial from 2 to (isqrt number) never (zerop (mod number factorial)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))

(do-primes (p 0 19)
  (format t "~d " p))

(do ((p (next-prime 0) (next-prime (1+ p))))
    ((> p 19))
  (format t "~d " p))
