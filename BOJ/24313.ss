(let* ((a1 (read)) (a0 (read)) (c (read)) (n0 (read)))
    (print (if (and (>= c a1) (<= (+ (* a1 n0) a0) (* c n0))) 1 0)))
