(define even?
    (lambda (n)
        (or 
            (zero? n)
            (odd? (- n 1)))))

(define odd?
    (lambda (n)
        (and
            (not (zero? n))
            (even? (- n 1)))))