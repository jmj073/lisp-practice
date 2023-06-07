(define (fac n)
    (let f ((n n) (i 2) (cnt 0))
        (if (> n 1)
            (if (= (gcd n i) 1)
                (begin
                    (or (zero? cnt) (print i " " cnt))
                    (f n (+ i 1) 0))
                (f (/ n i) i (+ cnt 1)))
            (or (zero? cnt) (print i " " cnt)))))

(do ((n (read) (- n 1))) ((zero? n)) (fac (read)))