(let map1 ((ls ls))
    (if (null? ls)
        '()
        (cons (f (car ls))
            (map1 (cdr ls)))))


((lambda map1 (ls)
    (if (null? ls)
        '()
        (cons (f (car ls))
            (map1 (cdr ls))))) ls)



(define lazy
    (lambda (t)
        (let ((val #f) (flag #f))
            (lambda ()
                (if (not flag)
                    (begin (set! val (t))
                        (set! flag #t)))
                val))))

(define make-stack
    (lambda ()
        (let ((ls '()))
            (lambda (msg . args)
                (cond
                    ((eqv? msg 'empty?) (null? ls))
                    ((eqv? msg 'push!)
                        (set! ls (cons (car args) ls)))
                    ((eqv? msg 'top) (car ls))
                    ((eqv? msg 'pop!)
                        (set! ls (cdr ls)))
                    (else "oops"))))))