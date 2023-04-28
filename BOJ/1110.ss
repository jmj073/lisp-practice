(define N (read))

(define cycle
    (lambda (n)
        (let ((d1 (remainder n 10)) (d2 (quotient n 10)))
            (+
                (remainder (+ d1 d2) 10)
                (* d1 10)))))

(define run
    (lambda (a cnt)
        (if (= a N)
            cnt
            (run (cycle a) (+ cnt 1)))))

(display (run (cycle N) 1))