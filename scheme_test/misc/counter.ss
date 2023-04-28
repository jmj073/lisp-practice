(define make-counter
    (lambda ()
        (let ((cnt 0))
            (lambda ()
                (let ((p cnt))
                    (set! cnt (+ cnt 1))
                    p)))))

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
(tell) => "sally likes harry"
secret => Error: variable secret is not bound