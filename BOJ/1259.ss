(define (f a l r)
    (cond
        ((>= l r) #t)
        ((not (char=? (string-ref a l) (string-ref a r))) #f)
        (else (f a (+ l 1) (- r 1)))))

(define (is-palindrom a)
    (f a 0 (- (string-length a) 1)))

(let loop ((n (read)))
    (if (not (zero? n))
        (begin
            (print (if (is-palindrom (number->string n)) "yes" "no"))
            (loop (read)))))