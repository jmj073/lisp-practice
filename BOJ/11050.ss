(define N (read))
(define K (read))

(display
    (let bc ((n N) (k K))
        (if (zero? k)
            1
            (/ (* n (bc (- n 1) (- k 1))) k))))


;; C(n, r) = n * C(n - 1, r - 1) / r
;; C(1, r) = 

