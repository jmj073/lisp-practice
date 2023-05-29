(define N (read))
(display (do ((i N (- i 1)) (a 0 b) (b 1 (+ a b))) ((zero? i) a)))
(display " ")
(display (max 1 (- N 2)))