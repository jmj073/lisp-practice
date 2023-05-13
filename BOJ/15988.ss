(define d (make-vector (+ #e1e6 1)))

(vector-set! d 1 1)
(vector-set! d 2 2)
(vector-set! d 3 4)

(let f ((n 4))
    (if (<= n #e1e6)
        (begin
            (vector-set! d n (modulo (+
                (vector-ref d (- n 1))
                (vector-ref d (- n 2))
                (vector-ref d (- n 3))) 1000000009))
            (f (+ n 1)))))

(define T (read))

(let f ((t T))
    (if (< 0 t)
        (let ((n (read)))
            (display (vector-ref d n))
            (newline)
            (f (- t 1)))))