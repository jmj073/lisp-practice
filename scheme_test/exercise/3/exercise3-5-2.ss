; apply-op, complain, do-calc

(define calc #f)

(let ()
  (set! calc
      (lambda (exp)
        ; grab an error continuation ek
        (call/cc
          (lambda (ek)

            (define complain
              (lambda (msg exp)
                (ek (list msg exp))))

            (define apply-op
              (lambda (op args)
                (op (do-calc (car args)) (do-calc (cadr args)))))

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

            (do-calc exp))))))

; (calc '(add (mul 3 2) -4)); => 2
; (calc '(div 1/2 1/6)); => 3
; (calc '(add (mul 3 2) (div 4))); => ("invalid expression" (div 4))
; (calc '(mul (add 1 -2) (pow 2 7))); => ("invalid operator" pow)

(print (calc '(add (mul 3 2) -4)))
(print (calc '(div 1/2 1/6)))
(print (calc '(add (mul 3 2) (div 4))))
(print (calc '(mul (add 1 -2) (pow 2 7))))