(let ((sum (lambda (ls)
             (if (null? ls)
                 0
                 (+ (car ls) (sum (cdr ls)))))))
  (sum '(1 2 3 4 5)))


(define foo
    (lambda ()
        (display bar)))

(define bar "hello")
(foo)

(letrec ((sum (lambda (ls)
                (if (null? ls)
                    0
                    (+ (car ls) (sum (cdr ls)))))))
  (sum '(1 2 3 4 5)))