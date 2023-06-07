(define (run n)
    (call/cc
        (lambda (k)
            (let f ((i (- n 1)) (sum 0))
                (if (= i 1)
                    (cond
                        ((= n (+ sum 1)) (display n) (display " = ") (display #\1))
                        (else (display n) (display " is NOT perfect.") (k 'non)))
                    (let ((d (if (zero? (modulo n i)) i 0)))
                        (f (- i 1) (+ sum d))
                        (if (not (zero? d)) (begin (display " + ") (display i))))))))
    (newline))

(do ((n (read) (read))) ((= n -1)) (run n))