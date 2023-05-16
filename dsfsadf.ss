; (let ((sum (lambda (ls)
;              (if (null? ls)
;                  0
;                  (+ (car ls) (sum (cdr ls)))))))
;   (sum '(1 2 3 4 5)))


; (define foo
;     (lambda ()
;         (display bar)))

; (define bar "hello")
; (foo)

; (letrec ((sum (lambda (ls)
;                 (if (null? ls)
;                     0
;                     (+ (car ls) (sum (cdr ls)))))))
;   (sum '(1 2 3 4 5)))

; ((lambda (x) x) 3)

; (lambda (x) x)

; (((call/cc (lambda (k) k)) (lambda (x) -)) 3)
; ((k (lambda (x) -)) 3)
; (((lambda (x) -) (lambda (x) -)) 3)
; (- 3)

; (((call/cc (lambda (k) k)) (lambda (x) x)) 3)
; ((k (lambda (x) x)) 3)
; (((lambda (x) x) (lambda (x) x)) 3)
; ((lambda (x) x) 3)


(letrec ((f (lambda (x) (cons 'a x)))
         (g (lambda (x) (cons 'b (f x))))
         (h (lambda (x) (g (cons 'c x)))))
  (cons 'd (h '())))

(letrec ((f (lambda (x k) (k (cons 'a x))))
         (g (lambda (x k)
              (f x (lambda (v) (k (cons 'b v))))))
         (h (lambda (x k) (g (cons 'c x) k))))
  (h '() (lambda (v) (cons 'd v))))
  
  
;   => (d b a c)


; (+ (* 3 4) 5)

; (lambda (v) (+ (* 3 4) v))

(define (g) (display "g1")(newline))
(define f (lambda () (g)))
(f)
(set! g (lambda () (display "g2")(newline)))
(f)

(define car&cdr
  (lambda (p k)
    (k (car p) (cdr p))))

(car&cdr '(a b c)
  (lambda (x y)
    (list y x))) => ((b c) a)
(car&cdr '(a b c) cons) => (a b c)
(car&cdr '(a b c a d) memv) => (a d)

(define integer-divide
  (lambda (x y success failure)
    (if (= y 0)
        (failure "divide by zero")
        (let ((q (quotient x y)))
          (success q (- x (* q y)))))))

(integer-divide 10 3 list (lambda (x) x)) => (3 1)
(integer-divide 10 0 list (lambda (x) x)) => "divide by zero"