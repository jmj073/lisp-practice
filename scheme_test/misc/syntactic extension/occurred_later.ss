; Error: unbound variable: ttt

(define (test)
    (display (ttt)))

(define-syntax ttt
    (syntax-rules ()
        ((_) "hi")))

(test)