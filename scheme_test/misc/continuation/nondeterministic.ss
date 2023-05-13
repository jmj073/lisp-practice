(define (print-list ls delim)
  (if (not (null? ls))
    (begin
      (display (car ls))
      (display delim)
      (print-list (cdr ls) delim))))

(define (print . ls)
  (print-list ls " "))

(define (println . ls)
  (apply print ls)
  (newline))

(define (cc)
  (call/cc (lambda (k) k)))

(define empty? null?)

(define fail-stack '())

(define (push-k k)
  (set! fail-stack (cons k fail-stack)))

(define (pop-k)
  (let ((k (car fail-stack)))
    (set! fail-stack (cdr fail-stack))
    k))

(define (fail)
  (if (empty? fail-stack)
    (error "backtracking stack exhausted!")
    (begin
      (let ((backtrack-point (pop-k)))
        (backtrack-point backtrack-point)))))

(define (amb choices)
  (let ((k (cc)))
    (if (empty? choices)
      (fail)
      (let ((choice (car choices)))
        (set! choices (cdr choices))
        (push-k k)
        choice))))

(define (assert condition)
  (if (not condition)
    (fail)
    #t))

(let ((a (amb (list 1 2 3 4 5 12 13)))
      (b (amb (list 1 2 3 4 5 12 13)))
      (c (amb (list 1 2 3 4 5 12 13))))
  (println a b c)
  (assert (= (* c c) (+ (* a a) (* b b))))
  (println (list a b c))
  (fail))