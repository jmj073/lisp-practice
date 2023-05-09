(define make-counter
    (lambda ()
        (let ((cnt 0))
            (lambda ()
                (let ((p cnt))
                    (set! cnt (+ cnt 1))
                    p)))))

(define cnt1 (make-counter))
(define cnt2 (make-counter))

(define fib1
    (lambda (n)
        (let fib ((i n))
            (cnt1)
            (if (<= i 1)
                i
                (+ (fib (- i 1)) (fib (- i 2)))))))

(define fib2
  (lambda (n)
    (let fib ((i n) (a 0) (b 1))
        (cnt2)
        (if (zero? i)
            a
            (fib (- i 1) b (+ a b))))))

(fib1 10)
(fib2 10)
(display "cnt1: ")(display (cnt1))(newline)
(display "cnt2: ")(display (cnt2))(newline)