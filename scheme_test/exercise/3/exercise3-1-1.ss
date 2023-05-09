(define-syntax and
    (syntax-rules ()
        ((_) #t)
        ((_ e) e)
        ((_ e1 e2 e3 ...)
            (if e1 (and e2 e3 ...) #f))))

; let -> lambda
; 0
(let ((x (memv 'a ls)))
    (and x (memv 'b x)))
; 1
(let ((x (memv 'a ls)))
    (if x (and (memv 'b x)) #f))
; 2
(let ((x (memv 'a ls)))
    (if x (memv 'b x) #f))