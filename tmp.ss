(define idf
    (lambda (x) x))

(define (cc)
    (call/cc idf))

; (let* ((yin ((lambda (k) (newline) k) (cc)))
;        (yang ((lambda (k) (display #\*) k) (cc))))
;     (yin yang))