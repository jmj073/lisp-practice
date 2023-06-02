(define T (read))

(define (run n)
    (do ((n n (modulo n (car c))) (c '(25 10 5 1) (cdr c)))
        ((null? c) (newline))
        (display (quotient n (car c)))
        (display " ")))

(do ((t T (- t 1)) (n (read) (read)))
    ((zero? t))
    (run n))