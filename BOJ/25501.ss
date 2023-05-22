(define (make-counter)
    (let ((cnt 0))
        (lambda ()
            (let ((p cnt))
                (set! cnt (+ cnt 1))
                p))))

(define (recursion s l r counter)
    (counter)
    (cond
        ((>= l r) 1)
        ((not (char=? (string-ref s r) (string-ref s l))) 0)
        (else (recursion s (+ l 1) (- r 1) counter))))

(define (is-palindrome s counter)
    (let ((len (string-length s)))
        (recursion s 0 (- len 1) counter)))


(define n (read))

(let loop ((n n))
    (if (< 0 n)
        (let ((s (symbol->string (read)))
               (cnt (make-counter)))
            (display (is-palindrome s cnt))
            (display " ")
            (display (cnt))
            (newline)
            (loop (- n 1)))))