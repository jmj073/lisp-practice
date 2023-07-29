(define (fold f init ls)
  (if (null? ls)
    init
    (fold f (f init (car ls)) (cdr ls))))

(define (pipe . fls)
  (lambda (x)
    (fold (lambda (x f) (f x)) x fls)))

(define (bind f . ls)
  (lambda args
    (apply f (append ls args))))

;; (define f (pipe
;;             (lambda (x) (+ x 1))
;;             (lambda (x) (+ x 2))
;;             (lambda (x) (+ x 3))))
;; 
;; (print (f 0))
