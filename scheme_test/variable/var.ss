(define ls '(1 2 3 4 5))
(define ls2 ls)

(set! ls2 (cdr ls2))
(display (car ls))(newline); 1

(set-car! (cdr ls) 9)
(display (car ls2))(newline); 9