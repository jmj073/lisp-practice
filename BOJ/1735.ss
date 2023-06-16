(let* ((a (read)) (b (read)) (c (read)) (d (read))
       (n (+ (/ a b) (/ c d))))
  (print (numerator n) " " (denominator n)))
