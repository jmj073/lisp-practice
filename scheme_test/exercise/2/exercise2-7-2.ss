(define shorter
    (lambda (a b)
        (if (<= (length a) (length b))
            a b)))