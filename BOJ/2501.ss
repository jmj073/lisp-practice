(define N (read))
(define K (read))

(display
    (let loop ((k K) (fac 1))
        (cond
            ((zero? k) (- fac 1))
            ((< N fac) 0)
            (else (loop (- k (if (zero? (modulo N fac)) 1 0)) (+ fac 1))))))