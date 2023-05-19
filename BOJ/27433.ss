; continuation passing style

(define (fac n k)
    (if (zero? n)
        (k 1)
        (fac (- n 1)
            (lambda (v)
                (k (* n v))))))

(fac (read) display)