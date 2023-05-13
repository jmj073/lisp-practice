(define N (read))

(display
    (let f ((n N) (a 1) (b 3))
        (if (< n 2)
            a
            (f (- n 1) b (modulo (+ (* a 2) b) 10007)))))