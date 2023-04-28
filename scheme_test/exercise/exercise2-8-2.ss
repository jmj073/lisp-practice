(define ap
    (lambda (a b)
        (if (null? a)
            b
            (cons 
                (car a)
                (ap (cdr a) b)))))

(define ap
    (lambda (a b)
        (if (null? a)
            b
            (cons 
                (car a)
                (ap b (cdr a))))))

(define ap
    (lambda (a b)
        (if (not (pair? a)); nonono!
            b
            (cons 
                (car a)
                (ap b (cdr a))))))

; '(1 . 2) '(3 4)
; '(3 4) 2
; 2 '(4) => error!

; '(1 2) '(3 4)
; '(3 4) '(2)
; '(2) '(4)
; '(4) '()
; '() '()