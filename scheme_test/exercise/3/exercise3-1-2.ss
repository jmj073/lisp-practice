(define-syntax or
    (syntax-rules ()
        ((_) #f)
        ((_ e) e)
        ((_ e1 e2 e3 ...)
            (let ((t e1))
                (if t t (or e2 e3 ...))))))
; let -> lambda
; 0
(or (memv x '(a b c)) (list x))
; 1
(let ((t (memv x '(a b c))))
    (if t t (or (list x))))
; 2
(let ((t (memv x '(a b c))))
    (if t t (list x)))