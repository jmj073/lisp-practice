(let ((k (call/cc (lambda (k) (cons 0 k)))))
    (display (car k))(newline)
    ((cdr k) (cons (+ (car k) 1) (cdr k))))

(call-with-values
  (lambda () (call/cc (lambda (k) (values k 0))))
  (lambda (k n)
    (write n)
    (newline)
    (k k (+ n 1))))