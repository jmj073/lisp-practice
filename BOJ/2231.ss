(define (g n)
    (do ((i n (quotient i 10)) (s 0 (+ s (modulo i 10)))) ((zero? i) (+ s n))))

(let ((N (read)))
    (display
        (let f ((i 0))
            (cond
                ((>= i N) 0)
                ((= (g i) N) i)
                (else (f (+ i 1)))))))
