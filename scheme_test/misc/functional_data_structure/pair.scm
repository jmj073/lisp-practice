(define (Pair left right)
  (lambda (f) (f left right)))

(define (get-left ls)
  (ls (lambda (left right) left)))

(define (get-right ls)
  (ls (lambda (left right) right)))
