(define retry #f)

; (define factorial
;   (lambda (x)
;     (if (= x 0)
;         (call/cc (lambda (k) (set! retry k) 1))
;         (* x (factorial (- x 1))))))

; (define factorial
;   (lambda (x k)
;     (if (= x 0)
;         (let () (set! retry k) (k 1))
;         (factorial (- x 1)
;             (lambda (v) (k (* x v)))))))

(define retry #f)

(define factorial
  (lambda (x)
    (let f ((x x) (k (lambda (x) x)))
      (if (= x 0)
          (begin (set! retry k) (k 1))
          (f (- x 1) (lambda (y) (k (* x y))))))))