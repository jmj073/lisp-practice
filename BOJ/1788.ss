(define fib
    (lambda (n a b)
        (if (positive? n)
            (fib (- n 1) b (remainder (+ a b) #e1e9))
            a)))

(define N (read))
(define ans (fib (abs N) 0 1))

(display (if (and (negative? N) (even? N)) -1 (min (abs N) 1)))
(newline)
(display ans)