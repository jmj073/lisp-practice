(define calc #f)

(let ()
  (define complain
    (lambda (msg exp)
      (error 'calc "~a ~s" msg exp)))

  (define do-calc
    (lambda (exp)
      (cond
        ((number? exp) exp)
        ((and (list? exp) (= (length exp) 3))
          (let ((op (car exp)) (args (cdr exp)))
            (case op
              ((add) (apply-op + args))
              ((sub) (apply-op - args))
              ((mul) (apply-op * args))
              ((div) (apply-op / args))
              (else (complain "invalid operator" op)))))
        (else (complain "invalid expression" exp)))))

  (define apply-op
    (lambda (op args)
      (op (do-calc (car args)) (do-calc (cadr args)))))

  (set! calc
    (lambda (exp)
      (do-calc exp))))

; (calc '(add (mul 3 2) -4)); => 2
; (calc '(div 1/2 1/6)); => 3
; (calc '(add (mul 3 2) (div 4))); => ("invalid expression" (div 4))
; (calc '(mul (add 1 -2) (pow 2 7))); => ("invalid operator" pow)

(print (calc '(add (mul 3 2) -4)))
(print (calc '(div 1/2 1/6)))
(print (calc '(add (mul 3 2) (div 4))))
(print (calc '(mul (add 1 -2) (pow 2 7))))