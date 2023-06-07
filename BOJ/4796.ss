(do ((n 1 (+ n 1)) (L (read) (read)) (P (read) (read)) (V (read) (read)))
    ((zero? L)) (display "Case ") (display n) (display ": ")
    (print (+ (* (quotient V P) L) (min L (modulo V P)))))