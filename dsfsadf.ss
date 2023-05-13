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


; (letrec ((f (lambda (x) (cons 'a x)))
;          (g (lambda (x) (cons 'b (f x))))
;          (h (lambda (x) (g (cons 'c x)))))
;   (cons 'd (h '())))
  
  
;   => (d b a c)


; (+ (* 3 4) 5)

; (lambda (v) (+ (* 3 4) v))

(define (g) (display "g1")(newline))
(define f (lambda () (g)))
(f)
(set! g (lambda () (display "g2")(newline)))
(f)