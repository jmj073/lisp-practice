; (define product
;   (lambda (ls)
;     (call/cc
;       (lambda (break)
;         (let f ((ls ls))
;           (cond
;             ((null? ls) 1)
;             ((= (car ls) 0) (break 0))
;             (else (* (car ls) (f (cdr ls))))))))))

; (define product
;   (lambda (ls k)
;     (let f ((ls ls) (k k))
;       (cond
;         ((null? ls) (k 1))
;         ((= (car ls) 0) (k 0))
;         (else (f (cdr ls) (lambda (v) (k (* (car ls) v)))))))))

(define product
  (lambda (ls k)
    (let ((break k))
      (let f ((ls ls) (k k))
        (cond
          ((null? ls) (k 1))
          ((= (car ls) 0) (break 0))
          (else (f (cdr ls)
                   (lambda (x)
                     (k (* (car ls) x))))))))))