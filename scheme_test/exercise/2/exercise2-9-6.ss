(define make-queue
  (lambda () '(())))

(define emptyq?
    (lambda (q)
        (null? (car q))))

(define putq!
    (lambda (q v)
        (let ((end (cons v '())))
            (if (emptyq? q)
                (begin
                    (set-car! q end)
                    (set-cdr! q end))
                (begin
                    (set-cdr! (cdr q) end)
                    (set-cdr! q end))))))

(define getq
    (lambda (q)
        (if (emptyq? q)
            (error 'getq "the queue is empty")
            (car (car q)))))

(define delq!
    (lambda (q)
        (if (emptyq? q)
            (error 'getq "the queue is empty")
            (set-car! q (cdar q)))
        (if (emptyq? q)
            (set-cdr! q '()))))
