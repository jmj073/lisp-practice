(define product
  (lambda (ls)
    (call/cc
      (lambda (break)
        (let f ((ls ls))
          (cond
            ((null? ls) 1)
            ((= (car ls) 0) (break 0))
            (else (* (car ls) (f (cdr ls))))))))))

(define product
  (lambda (ls)
    (let f ((ls ls))
      (cond
        ((null? ls) 1)
        ((= (car ls) 0) 0)
        (else (* (car ls) (f (cdr ls))))))))
