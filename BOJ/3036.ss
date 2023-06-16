(let* ((N (read)) (a (read)))
  (do ((n N (- n 1))) ((= n 1))
    (let ((b (/ a (read))))
      (print (numerator b)#\/(denominator b)))))
