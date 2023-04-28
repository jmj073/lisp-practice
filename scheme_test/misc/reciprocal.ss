(define reciprocal
    (lambda (n)
        (if (and (number? n) (not (zero? n)))
            (/ n)
            (error 'reciprocal
                "improper argument" n))))