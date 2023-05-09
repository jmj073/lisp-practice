(define list-ref
    (lambda (ls i)
        (if (zero? i)
            (car ls)
            (list-ref (cdr ls) (- i 1)))))

(define list-tail
    (lambda (ls i)
        (if (zero? i)
            ls
            (list-tail (cdr ls) (- i 1)))))