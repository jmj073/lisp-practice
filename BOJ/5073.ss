(do ((a (read) (read)) (b (read) (read)) (c (read) (read)))
    ((= a b c 0))
        (print
            (cond
                ((>= (* (max a b c) 2) (+ a b c)) "Invalid")
                ((= a b c) "Equilateral")
                ((or (= a b) (= b c) (= a c)) "Isosceles")
                (else "Scalene"))))

; m > a + b + c - m