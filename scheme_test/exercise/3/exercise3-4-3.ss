(define reciprocals
  (lambda (ls)
    (call/cc
      (lambda (k)
        (map (lambda (x)
               (if (= x 0)
                   (k "zero found")
                   (/ 1 x)))
             ls)))))

(define map
  (lambda (p ls k)
    (if (null? ls)
        '()
        (cons (p (car ls))
              (map p (cdr ls))))))

;; ==============================================

(define map/k
  (lambda (p ls k)
    (if (null? ls)
        (k '())
        (p (car ls)
          (lambda (x)
            (map/k p (cdr ls)
              (lambda (ls)
                (k (cons x ls)))))))))

(define reciprocals
  (lambda (ls)
    (map/k (lambda (x k) (if (= x 0) "zero found" (k (/ 1 x))))
           ls
           (lambda (x) x))))