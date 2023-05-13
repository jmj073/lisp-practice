; pause를 호출하지 않고 반환?
;   다음 lwp가 실행되지 않는다!

(define lwp-list '())

(define lwp
  (lambda (thunk)
    (set! lwp-list (append lwp-list (list thunk))))); push_back

(define start
  (lambda ()
    (if (not (null? lwp-list))
      (let ((p (car lwp-list)))
        (set! lwp-list (cdr lwp-list)); pop_front
        (p)))))

(define pause
  (lambda ()
    (call/cc
      (lambda (k)
        (lwp (lambda () (k #f))); push_back
        (start))))); pop_front

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
(display "=================")