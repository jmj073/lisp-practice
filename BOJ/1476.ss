(let* ((e (- (read) 1)) (s (- (read) 1)) (m (- (read) 1)))
  (define n (do ((i e (+ i 15))) ((= (modulo i 28) s) i)))
  (define l (lcm 15 28))
  (print (do ((n n (+ n l))) ((= (modulo n 19) m) (+ n 1)))))
