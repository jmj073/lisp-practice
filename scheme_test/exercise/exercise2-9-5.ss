(define make-queue
  (lambda ()
    (let ((end (cons 'ignored '())))
      (cons end end))))

(define emptyq?
    (lambda (q)
        (eqv? (caar q) 'ignored)))

(define putq!
  (lambda (q v)
    (let ((end (cons 'ignored '())))
      (set-car! (cdr q) v)
      (set-cdr! (cdr q) end)
      (set-cdr! q end))))

(define getq
  (lambda (q)
    (if (emptyq? q)
        (error 'getq "the queue is empty")
        (car (car q)))))

(define delq!
  (lambda (q)
    (if (emptyq? q)
        (error 'getq "the queue is empty")
        (set-car! q (cdar q)))))
