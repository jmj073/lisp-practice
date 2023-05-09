(define list?
    (lambda (ls)
        (if (pair? ls)
            (list? (cdr ls))
            (null? ls))))

(define list??
    (lambda (ls)
        (define ls?
            (lambda (h t)
                (if (not (pair? h))
                    (null? h)
                    (if (not (pair? (cdr h)))
                        (null? (cdr h))
                        (and
                            (not (eq? (cdr h) t))
                            (ls? (cddr h) (cdr t)))))))
        (ls? ls ls)))


(define race
  (lambda (hare tortoise)
    (if (pair? hare)
        (let ((hare (cdr hare)))
          (if (pair? hare)
              (and (not (eq? hare tortoise))
                   (race (cdr hare) (cdr tortoise)))
              (null? hare)))
        (null? hare))))

(define list?
  (lambda (x)
    (race x x)))


