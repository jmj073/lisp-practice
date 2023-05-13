; 1 ===================================

; (define *k* #f) 

; (*k* (call/cc
;       (lambda (k)
;         (set! *k* k) 1)))

; (display "hello")

; 2 ===================================

(define *k* #f) 

(begin
    (display
        (+ 
            (call/cc
                (lambda (k)
                    (begin
                    (set! *k* k)  
                    2)))
            5))
    (*k* 1))