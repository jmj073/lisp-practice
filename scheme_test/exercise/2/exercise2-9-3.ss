(define make-stack
    (lambda ()
        (let ((ls '()))
            (lambda (msg . x)
                (case msg
                    ((push!)
                        (set! ls (cons (car x) ls)))
                    ((pop!)
                        (set! ls (cdr ls)))
                    ((empty? mt?)
                        (null? ls))
                    ((top)
                        (car ls))
                    ((ref)
                        (list-ref ls (car x)))
                    ((set!)
                        (set-car! (list-tail ls (car x)) (cadr x)))
                    (else 'undefined))))))