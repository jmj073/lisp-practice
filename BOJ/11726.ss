(define N (read))

(display
    (let f ((n N) (a 1) (b 2))
        (if (< n 2)
            a
            (f (- n 1) b (modulo (+ a b) 10007)))))

(display
    (modulo 
        (let f ((n N) (a 1) (b 2))
            (if (< n 2)
                a
                (f (- n 1) b (+ a b))))
        10007))