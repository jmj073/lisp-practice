(define make-queue
    (lambda ()
        (let ((end (cons 'ignored '())))
            (cons end end))))

(define mtq?
    (lambda (q)
        (eq? (car q) (cdr q))))

(define putq!
    (lambda (q v)
        (let ((end (cons 'ignored '())))
            (set-car! (cdr q) v)
            (set-cdr! (cdr q) end)
            (set-cdr! q end))))

(define getq
    (lambda (q)
        (car (car q))))

(define delq!
    (lambda (q)
        (set-car! q (cdar q))))

(define popq!
    (lambda (q)
        (let ((a (getq q)))
            (delq! q)
            a)))

(define rotate!
    (lambda (q n)
        (if (< 0 n)
            (begin
                (putq! q (popq! q))
                (rotate! q (- n 1))))))

(define N (read))
(define K (- (read) 1))

(define q (make-queue))

(let loop ((i 1))
    (if (<= i N)
        (begin
            (putq! q i)
            (loop (+ i 1)))))

(display #\<)
(let loop ()
    (rotate! q K)
    (display (popq! q))
    (if (not (mtq? q))
        (begin
            (display ", ")
            (loop))))
(display #\>)