(do ((i (read) (- i 1))) ((zero? i))
  (let* ((h (read)) (w (read)) (n (- (read) 1)))
    (print (+ (* (+ (modulo n h) 1) 100) (+ (quotient n h) 1)))))
