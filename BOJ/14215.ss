(define ls (list (read) (read) (read)))
(let* ((m (apply max ls)) (s (apply + ls)))
    (display (+ (min m (- s m 1)) (- s m))))