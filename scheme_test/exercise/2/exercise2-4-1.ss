(+ (- (* 3 a) b) (+ (* 3 a) b)); a
(let ((x (* 3 a))) (+ (- x b) (+ x b)))
(let ((x (* 3 a))) (* x 2))

(cons (car (list a b c)) (cdr (list a b c))); b
(let ((l (list a b c))) (cons (car l) (cdr l)))
(let ((l (list a b c))) l)

