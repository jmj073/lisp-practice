(letrec ((even?
          (lambda (x)
                (or (= x 0)
                    (odd? (- x 1)))))
         (odd?
          (lambda (x)
                (and (not (= x 0))
                    (even? (- x 1))))))
  (even? 20))

(let even? ((x 20))
    (or (= x 0)
        (let odd? ((x (- x 1)))
            (and (not (= x 0))
                (even? (- x 1))))))

(let even? ((x 20))
    (or (= x 0)
        (let ((x (- x 1)))
            (and (not (= x 0))
                (even? (- x 1))))))