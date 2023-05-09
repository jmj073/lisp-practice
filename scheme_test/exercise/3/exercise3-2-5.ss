(define-syntax let
    (syntax-rules ()
        ((_ ((x v) ...) e1 e2 ...)
         ((lambda (x ...) e1 e2 ...) v ...))
        ((_ name ((x v) ...) e1 e2 ...)
         (letrec ((name (lambda (x ...) e1 e2 ...)))
            (name v ...)))))