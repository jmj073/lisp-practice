(define n (read))
(write (do ((i 1 (+ i 1)) (c (+ (* (modulo n 10) 10) (modulo (+ n (quotient n 10)) 10)) (+ (* (modulo c 10) 10) (modulo (+ c (quotient c 10)) 10)))) ((= c n) i)))