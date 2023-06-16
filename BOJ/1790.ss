(define N (read))
(define K (read))

(do ((k (- K 1) (- k (* e i))) (i 1 (+ i 1)) (e 9 (* e 10)) (n N (- n e)))
  ((> (* e i) k)
    (print
      (if (>= k (* n i))
        -1
        (+ (modulo (quotient k (* i (expt 10 (- i (modulo k i) 1)))) 10)
          (if (zero? (modulo k i)) 1 0))))))