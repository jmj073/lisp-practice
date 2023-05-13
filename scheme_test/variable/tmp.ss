(define idf
    (lambda (x) x))

(define (cc)
    (call/cc idf))

(define (foo ls)
    (let ((k (cc)))
        (set! ls (cdr ls))
        (display (car ls))
        (newline)
        (k idf)))

(foo '(1 2 3 4 5)); 2 3


(define shhh #f)
(define tell #f)
(let ((secret 0))
  (set! shhh
    (lambda (message)
      (set! secret message)))
  (set! tell
    (lambda ()
      secret)))

(shhh "sally likes harry")
(tell); => "sally likes harry"