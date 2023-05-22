(define calc #f)

(let ()
  (define do-calc
    (lambda (ek exp)
      (cond
        ((number? exp) exp)
        ((and (list? exp) (= (length exp) 3))
          (let ((op (car exp)) (args (cdr exp)))
            (case op
              ((add) (apply-op ek + args))
              ((sub) (apply-op ek - args))
              ((mul) (apply-op ek * args))
              ((div) (apply-op ek / args))
              (else (complain ek "invalid operator" op)))))
        (else (complain ek "invalid expression" exp)))))
  (define apply-op
    (lambda (ek op args)
      (op (do-calc ek (car args)) (do-calc ek (cadr args)))))

  (define complain
    (lambda (ek msg exp)
      (ek (list msg exp))))

  (set! calc
    (lambda (exp)
      ; grab an error continuation ek
      (call/cc
        (lambda (ek)
          (do-calc ek exp))))))

(calc '(add (mul 3 2) -4)); => 2
(calc '(div 1/2 1/6)); => 3
(calc '(add (mul 3 2) (div 4))); => ("invalid expression" (div 4))
(calc '(mul (add 1 -2) (pow 2 7))); => ("invalid operator" pow)