; 1. No factors of n besides n itself can possibly be found beyond sqrt(n).
; 2. The division (/ n i) is performed twice when a factor is found.
; 3. After 2, no even factors can possibly be found.

; Which is the most important problem to solve?
; Are there any additional improvements you can make?

(define factor
    (lambda (n)
        (let f ((n n) (i 2))
            (cond
                ((>= i n) (list n))
                ((integer? (/ n i))
                 (cons i (f (/ n i) i)))
                (else (f n (+ i 1)))))))


(define factor
    (lambda (n)
        (let f ((n n) (i 2))
            (if (> (* i i) n)
                (list n)
                (let ((d (/ n i)))
                    (if (integer? d)
                        (cons i (f d i))
                        (f n (+ i 1))))))))

(define factor
  (lambda (n)
    (let f ((n n) (i 2) (step 1))
      (if (> (* i i) n)
          (list n)
          (let ((n/i (/ n i)))
            (if (integer? n/i)
                (cons i (f n/i i step))
                (f n (+ i step) 2)))))))

(define factor
  (lambda (n)
    (let f ((n n) (i 2) (step 1))
      (if (> (* i i) n)
          (list n)
          (if (= (gcd n i) 1)
              (f n (+ i step) 2)
              (cons i (f (/ n i) i step)))))))


(call/cc (lambda (k) (display "hi") (k 33) (display "hello")))

(let ((x (call/cc (lambda (k) k))))
  (x (lambda (ignore) ignore)))