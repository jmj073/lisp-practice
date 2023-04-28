(define fold
    (lambda (init f ls); (f accumulation next)
        (if (null? ls)
            init
            (fold
                (f init (car ls))
                f
                (cdr ls)))))

(define reduce
    (lambda (f ls)
        (fold (car ls) f (cdr ls))))

; (reduce + '())