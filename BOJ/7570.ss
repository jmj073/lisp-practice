; (define N (read))
; (define d (make-vector (+ N 1) 0))

; (let f ((i N) (a 0))
;     (if (zero? i)
;         (display (- N a))
;         (let* ((num (read))(tmp (+ (vector-ref d (- num 1)) 1)))
;             (vector-set! d num tmp)
;             (f (- i 1) (max a tmp)))))

(define N (read))
(do ((i N (- i 1)) (a 1 (if (= (read) a) (+ a 1) a)))
    ((= i 1) (display (- N a))))