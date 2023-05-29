(define (prime? n)
    (if (<= n 1)
        #f
        (let loop ((i 2))
            (if (<= (* i i) n)
                (if (= (gcd n i) 1)
                    (loop (+ i 1))
                    #f)
                #t))))

(let loop ((n (read)) (cnt 0))
    (if (< 0 n)
        (loop (- n 1) (+ cnt (if (prime? (read)) 1 0)))
        (display cnt)))