(define foreach
    (lambda (f ls)
        (cond
            ((not (null? ls))
                (f (car ls))
                (foreach f (cdr ls))))))

(foreach display '(1 -2 3 -4 5 -6))