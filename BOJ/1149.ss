(define u (lambda (a b c) (+ a (min b c))))
(define N (read))

(define ls 
    (let f ((n N) (r 0) (g 0) (b 0))
        (if (zero? n)
            (list r g b)
            (let* ((r+ (read)) (g+ (read)) (b+ (read)))
                (f (- n 1) (u r+ g b) (u g+ r b) (u b+ r g))))))

(display (apply min ls))