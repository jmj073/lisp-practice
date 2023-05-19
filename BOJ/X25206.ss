(define (rank->score rank)
    (let* ((rank (symbol->string rank))
           (a (char->integer (string-ref rank 0)))
           (b (string-ref rank 1)))
        (if (< a 69)
            (+ (- 69 a) (if (char=? b #\+) 0.5 0))
            0)))

(display (/ 
    (let loop ((n 2))
        (if (< 0 n) (begin
            (read)
            (let* ((score (read)) (rank (read)))
                (+ (* score (rank->score rank))
                    (loop (- n 1)))
                    ))))
    20))

; (let* ((rank (symbol->string rank)) (a (string-ref rank 1))) a)