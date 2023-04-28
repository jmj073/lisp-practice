(define fold
    (lambda (init f ls); (f accumulation next)
        (if (null? ls)
            init
            (fold
                (f init (car ls))
                f
                (cdr ls)))))

; (fold 4 + '(1 2 3))