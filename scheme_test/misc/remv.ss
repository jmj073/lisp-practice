(define remv
    (lambda (x ls)
        (cond
            ((null? ls) '())
            ((eqv? x (car ls)) (remv x (cdr ls)))
            (else (cons (car ls) (remv x (cdr ls)))))))

(display (remv 1 '(1 2 3 1 4 . 4)))