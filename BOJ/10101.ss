(let ((a (read)) (b (read)) (c (read)))
    (display
        (cond
            ((not (= (+ a b c) 180)) "Error")
            ((= a b c 60) "Equilateral")
            ((or (= a b) (= b c) (= a c)) "Isosceles")
            (else "Scalene"))))