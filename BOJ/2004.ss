(define (sol n d) (do ((cnt 0 (+ cnt (quotient n d))) (n n (quotient n d))) ((zero? n) cnt)))
(let* ((n (read)) (m (read))) (display (apply min (map (lambda (d) (- (sol n d) (sol m d) (sol (- n m) d))) '(2 5)))))
