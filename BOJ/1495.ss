(define d (make-vector 251 1))

(let f ((n 2) (a 1) (b 1))
    (if (< n 251)
        (let ((a b)
              (b (+ (* a 2) b)))
            (vector-set! d n b)
            (f (+ n 1) a b))))

(let f ((n (read)))
    (if (not (eof-object? n))
        (begin
            (display (vector-ref d n))
            (newline)
            (f (read)))))