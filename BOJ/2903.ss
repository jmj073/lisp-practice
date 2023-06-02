; (display (do ((n (read) (- n 1)) (i 2 (- (* i 2) 1))) ((= n 0) (* i i))))
(display (let ((n (+ (expt 2 (read)) 1))) (* n n)))