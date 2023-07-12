(let ((n (read)))
    (do ((i 0 (+ i 1)) (two 0 (+ two i)) (three 0 (+ three two))) ((>= i n) (print three))))
(print 3)
