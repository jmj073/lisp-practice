(do ((t (read) (- t 1))) ((zero? t))
  (let* ((x (read)) (y (read)) (n (- y x)))
    (do ((i 1 (+ i 2)) (n n (- n i)))
      ((> i n) (print (- i (if (zero? n) 2 (if (< (quotient (- i 1) 2) n) 0 1))))))))
