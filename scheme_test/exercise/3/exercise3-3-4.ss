; 뀨?=============================================
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

; main================================================================

(define lwp-list (make-queue))

(define lwp
  (lambda (thunk)
    (putq! lwp-list thunk)))

(define start
  (lambda ()
    (if (not (emptyq? lwp-list))
      (let ((p (getq lwp-list)))
        (delq! lwp-list)
        (p)))))

(define pause
  (lambda ()
    (call/cc
      (lambda (k)
        (lwp (lambda () (k #f)))
        (start)))))

(define lwp-exit start)

; (lwp (lambda () (let f () (display "h"))))
; (lwp (lambda () (let f () (display "e"))))
; (lwp (lambda () (let f () (display "y"))))
; (lwp (lambda () (let f () (display "!"))))
; (lwp (lambda () (let f () (newline)    )))
; (start)

(lwp (lambda () (let f () (display "h") (lwp-exit))))
(lwp (lambda () (let f () (display "e") (lwp-exit))))
(lwp (lambda () (let f () (display "y") (lwp-exit))))
(lwp (lambda () (let f () (display "!") (lwp-exit))))
(lwp (lambda () (let f () (newline)     (lwp-exit))))
(start)