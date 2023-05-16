(define reciprocal
  (lambda (n success failure)
    (if (= n 0)
        (failure "oops!")
        (success (/ 1 n)))))