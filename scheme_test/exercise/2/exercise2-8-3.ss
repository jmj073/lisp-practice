(define make-list
    (lambda (n obj)
        (if (<= n 0)
            '()
            (cons obj (make-list (- n 1) obj)))))