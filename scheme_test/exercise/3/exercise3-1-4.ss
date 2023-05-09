(define-syntax when
    (syntax-rules ()
        ((_ test e1 e2 ...)
         (if test (begin e1 e2 ...)))))

(define-syntax unless
    (syntax-rules ()
        ((_ test e1 e2 ...)
         (when (not test) e1 e2 ...))))